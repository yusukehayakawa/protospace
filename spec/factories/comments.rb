include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :comment do
    text    { Faker::Lorem.sentences }
  end
end

