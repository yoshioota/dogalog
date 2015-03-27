FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :movie do
    association :user, factory: :user
    title { 'MyString' }
    description { 'MyText' }
    url { 'https://www.youtube.com/watch?v=6XvmhE1J9PY' }
  end

  factory :review do
    association :movie, factory: :movie
    association :user, factory: :user
    title { 'MyString' }
    description { 'MyText' }
    rating { 1 }
    in_public { false }
  end

  factory :user do
    email { generate(:email) }
    display_name { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now }
  end

  factory :desk_user do
    email { generate(:email) }
    display_name { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.now }
  end
end
