FactoryBot.define do
    factory :word do
        name { 'word' }
        example { 'test example' }
        translation { '単語' }
        user
    end 
end