FactoryGirl.define do
  factory :user do
    token "test_token"
  end

  factory :business do
    name Faker::Company.name
    phone Faker::PhoneNumber.phone_number
    email Faker::Internet.email
    twitter Faker::Internet.url('twitter.com')
    facebook Faker::Internet.url('facebook.com')
    website Faker::Internet.url
    owner Faker::Name.name
    address1 Faker::Address.street_address
    address2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip_code
  end
end