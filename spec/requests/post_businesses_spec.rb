require 'rails_helper'

describe "authentication for post requests", type: :request do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:business) {FactoryGirl.create(:business)}

  it 'returns status code 422 if params passed do not meet validations' do
    post "/businesses/", params: {token: user.token}
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'returns status code 401 for an unauthenticated user and a post request' do
    post "/businesses/"
    expect(response).to have_http_status(:unauthorized)
  end

  it 'returns status code 200 when an entry is sucessfully created' do
    post "/businesses/", params: {
      token: user.token,
      name: Faker::Company.name,
      phone: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email,
      twitter: Faker::Internet.url('twitter.com'),
      facebook: Faker::Internet.url('facebook.com'),
      website: Faker::Internet.url,
      owner: Faker::Name.name,
      address1: Faker::Address.street_address,
      address2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code,
    }
    expect(response).to have_http_status(:success)
  end

end