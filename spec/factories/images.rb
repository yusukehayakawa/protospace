include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :image do
    image  { fixture_file_upload("spec/fixtures/aaproto4-2.jpg", 'image/png') }
  end
end
