# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    settings_private false
    date_of_birth { 21.years.ago }

    factory :private_user do
      settings_private true
    end

    factory :underage_user do
      date_of_birth { 20.years.ago }
    end

    factory :user_with_posts do
      ignore do
        posts_count 10
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end

  end

end
