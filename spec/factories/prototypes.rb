include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :prototype do
    name        { Faker::Address.country }
    catch_copy  { Faker::Address.country }
    concept     { Faker::Address.country }
  end
end
