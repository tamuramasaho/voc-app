User.create!(name: "Example User",
             email: "example@example.com",
             password: "password",
             password_confirmation: "password",
             admin: true)

User.create!(name: "Example User-2",
             email: "example-2@example.com",
             password: "password",
             password_confirmation: "password",
             admin: false)

users = User.take(2)
50.times do
    word = Faker::Verb.base
    translation = Faker::Lorem.word
    example = Faker::Address.full_address
    users.each do |user| 
        user.words.create!(name: word, translation: translation, example: example)
    end
end