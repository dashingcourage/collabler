FactoryBot.define do
  password = Faker::Internet.password(8)

  factory :user do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    username              Faker::Name.unique.name
    password              password
    password_confirmation password
  end
end