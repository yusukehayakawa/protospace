include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :user do
    pass = Faker::Internet.password(6)
    username                { Faker::Name.name }
    email                   { Faker::Internet.email }
    password                pass
    password_confirmation   pass
    member                  { Faker::Hacker.say_something_smart }
    profile                 { Faker::Address.country }
    works                   { Faker::Company.catch_phrase }
    avatar            { fixture_file_upload("spec/fixtures/aaproto4-2.jpg", 'image/png') }
  end
end
