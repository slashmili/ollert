FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :username do |n|
    "username#{n}"
  end

  sequence :title do |n|
    "FooBoard#{n}"
  end

  factory :board do
    title
  end

  factory :user do
    email
    username
    initials "SR"
    password 'f4k3p455w0rd'
  end

  factory :card do
    title 'Card title'
    list_id 0
  end
end
