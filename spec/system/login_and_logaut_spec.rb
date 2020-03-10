require 'rails_helper'

describe 'user session system', type: :system do
    let(:user_a) do
      FactoryBot.create(:user, name: 'ユーザーA',
                               email: 'a@example.com')
    end

    before do
        visit login_path
        fill_in 'メールアドレス', with: login_user.email
        fill_in 'パスワード', with: login_user.password
        click_button 'ログインする'
    end

    context 'with valid information' do
        let(:login_user) { user_a }
        it 'logout' do
            click_link 'ログアウト'
            expect(page).to have_content 'This is Vocabulary-app'
        end
    end
end
            

