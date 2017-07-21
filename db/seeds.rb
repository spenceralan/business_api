require 'faker'

Business.destroy_all

250.times do
  Business.create!(
    name: Faker::Company.name,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    twitter: Faker::Internet.url('twitter.com'),
    facebook: Faker::Internet.url('facebook.com'),
    website: Faker::Internet.url,
    owner: Faker::Name.name ,
    address1: Faker::Address.street_address,
    address2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code,
  )
end