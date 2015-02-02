# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    image_url "MyString"
    body_text "MyString"

    # user
    association :user
  end
end
