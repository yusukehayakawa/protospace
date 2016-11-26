include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    pass = Faker::Internet.password(6)

    username                Faker::Name.name
    email                   Faker::Internet.email
    password                pass
    password_confirmation   pass
    member                  Faker::Address.country
    profile                 Faker::Address.country
    works                   Faker::Address.country
    avatar                  Faker::Avatar.image
  end
end
