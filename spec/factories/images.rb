include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :image do
    image    Faker::Avatar.image
  end
end
