require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with name, email and password' do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it 'is invalid without name' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors.full_messages).to include('名前を入力してください')
  end

  it 'is invalid without email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors.full_messages).to include('メールアドレスを入力してください')
  end

  it 'is invalid without password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors.full_messages).to include('パスワードを入力してください')
  end

  it 'is invalid with duplicated email' do
    FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors.full_messages).to include('メールアドレスはすでに存在します')
  end
end
