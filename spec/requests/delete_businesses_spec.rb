require 'rails_helper'

describe "authentication for delete requests", type: :request do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:business) { FactoryGirl.create(:business) }
  let!(:businesses) { FactoryGirl.create_list(:business, 20) }

  it 'returns status code 200 for an authenticated user and a delete request' do
    delete "/businesses/#{business.id}", params: { token: user.token }
    expect(response).to have_http_status(:success)
  end

  it 'returns status code 401 for an unauthenticated user and a delete request' do
    delete "/businesses/#{business.id}"
    expect(response).to have_http_status(:unauthorized)
  end

  it 'should have one less entry after sucessful delete request' do
    get "/businesses/", params: { token: user.token }
    expect(JSON.parse(response.body).size).to eq(21)
    delete "/businesses/#{business.id}", params: { token: user.token }
    get "/businesses/", params: { token: user.token }
    expect(JSON.parse(response.body).size).to eq(20)
  end

end