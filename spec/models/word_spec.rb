require 'rails_helper'

RSpec.describe Word, type: :model do
  it 'is valid with name, tlanslation' do
    word = FactoryBot.create(:word)
    expect(word).to be_valid
  end

  it 'is invalid without name' do
    word = FactoryBot.build(:word, name: nil)
    word.valid?
    expect(word.errors.full_messages).to include('単語を入力してください')
  end

  it 'is invalid with name that include over 31 characters' do
    word = FactoryBot.build(:word, name: 'a' * 31)
    word.valid?
    expect(word.errors.full_messages).to include('単語は30文字以内で入力してください')
  end

  it 'is invalid with name that include comma' do
    word = FactoryBot.build(:word, name: 'a,a')
    word.valid?
    expect(word.errors.full_messages).to include('単語にカンマを含めることはできません')
  end

  it 'is invalid without translation' do
    word = FactoryBot.build(:word, translation: nil)
    word.valid?
    expect(word.errors.full_messages).to include('訳を入力してください')
  end
end
