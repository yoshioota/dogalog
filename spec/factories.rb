FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :movie do
    title { 'MyString' }
    description { 'MyText' }
    url { 'MyText' }
    user { nil }
  end

  factory :review do
    movie { nil }
    user { nil }
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
  end
end
