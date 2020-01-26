require 'rails_helper'

describe '単語管理機能', type: :system do
  # ユーザーAとユーザーBを作成するが、letが初めて呼ばれるまで評価しない
  let(:user_a) do
    FactoryBot.create(:user, name: 'ユーザーA',
                             email: 'a@example.com')
  end
  let(:user_b) do
    FactoryBot.create(:user, name: 'ユーザーB',
                             email: 'b@example.com')
  end
  let!(:word_a) do
    FactoryBot.create(:word, name: 'first word',
                             translation: '訳', user: user_a)
  end

  before do
    # 作成者がユーザAである単語を作成しておく
    FactoryBot.create(:word, name: 'first word', user: user_a)
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  shared_examples_for 'ユーザーAが作成した単語が表示される' do
    it { expect(page).to have_content 'first word' }
  end

  describe '一覧表示機能' do
    context 'ユーザAがログインしている時' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成した単語が表示される'
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成した単語が表示されない' do
        # ユーザーAが作成した単語の名称が画面上に表示されていないことを確認
        expect(page).to have_no_content 'first word'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      before do
        visit word_path(word_a)
      end

      it_behaves_like 'ユーザーAが作成した単語が表示される'
    end
  end

  describe '新規作成機能' do
    let(:login_user) { user_a }

    before do
      visit new_word_path
      fill_in 'word_name', with: word_name
      fill_in 'word_translation', with: word_translation
      click_button '登録する'
    end

    context '新規作成画面で名称を入力したとき' do
      let(:word_name) { '新規作成のテストを書く' }
      let(:word_translation) { '訳を入れたはず' }

      it '正常に登録される' do
        expect(page).to have_selector '.alert-success',
                                      text: '新規作成のテストを書く'
      end
    end

    context '新規作成画面で名称を入力しなかったとき' do
      let(:word_name) { '' }
      let(:word_translation) { '訳を入れたはず' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content '単語を入力してください'
        end
      end
    end
  end
end
