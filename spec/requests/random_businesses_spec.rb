require 'rails_helper'

UUID = /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/

describe "authentication for random requests", :type => :request do
  let!(:user) {FactoryGirl.create(:user)}

  it 'returns status code 200 for an authenticated user and a random request' do
    get '/businesses/random/', params: {token: user.token}
    expect(response).to have_http_status(:success)
  end

  it 'returns status code 401 for an authenticated user and a random request' do
    get '/businesses'
    expect(response).to have_http_status(:unauthorized)
  end

end

describe "get random businesses route", type: :request do
  let!(:businesses) { FactoryGirl.create_list(:business, 20)}
  let!(:user) {FactoryGirl.create(:user)}

  before { get '/businesses/random/', params: {token: user.token} }

  it 'returns a random business' do
    expect(JSON.parse(response.body)["id"]).to match(UUID)
  end

end