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