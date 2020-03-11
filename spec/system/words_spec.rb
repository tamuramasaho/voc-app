require 'rails_helper'

describe 'words management system', type: :system do
  let(:user_a) do
    FactoryBot.create(:user, name: 'ユーザーA',
                             email: 'a@example.com')
  end
  let(:user_b) do
    FactoryBot.create(:user, name: 'ユーザーB',
                             email: 'b@example.com',
                             admin: false)
  end
  let!(:word_a) do
    FactoryBot.create(:word, name: 'first word',
                             translation: '訳', user: user_a)
  end

  before do
    FactoryBot.create(:word, name: 'first word', user: user_a)
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  shared_examples_for 'showing words made by ユーザーA' do
    it { expect(page).to have_content 'first word' }
  end

  describe 'words index test' do
    context 'when ユーザーA is logged in' do
      let(:login_user) { user_a }

      it_behaves_like 'showing words made by ユーザーA'

      it 'has users index link' do
        expect(page).to have_content 'Users'
      end
    end

    context 'when ユーザーB is logged in' do
      let(:login_user) { user_b }

      it 'does not have words made by ユーザーA' do
        expect(page).to have_no_content 'first word'
      end

      it 'does not have users index link' do
        expect(page).not_to have_content 'Users'
      end
    end
  end

  describe 'word show test' do
    context 'when ユーザーA is logged in' do
      let(:login_user) { user_a }

      before do
        visit word_path(word_a)
      end

      it_behaves_like 'showing words made by ユーザーA'
    end
  end

  describe 'word new test' do
    let(:login_user) { user_a }

    before do
      visit new_word_path
      fill_in 'word_name', with: word_name
      fill_in 'word_translation', with: word_translation
      click_button '登録する'
    end

    context 'input with word name and translation' do
      let(:word_name) { '新規作成のテストを書く' }
      let(:word_translation) { '訳を入れたはず' }

      it 'is saved correctly' do
        expect(page).to have_selector '.alert-success',
                                      text: '新規作成のテストを書く'
      end
    end

    context 'input without word name' do
      let(:word_name) { '' }
      let(:word_translation) { '訳を入れたはず' }

      it 'has an error' do
        within '#error_explanation' do
          expect(page).to have_content '単語を入力してください'
        end
      end
    end
  end
end
