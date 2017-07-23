require 'rails_helper'

describe "authentication for put requests", type: :request do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:business) {FactoryGirl.create(:business)}


  it 'returns status code 200 for an authenticated user and a put request' do
    put "/businesses/#{business.id}", params: {token: user.token}
    expect(response).to have_http_status(:success)
  end

  it 'returns status code 401 for an unauthenticated user and a put request' do
    put "/businesses/#{business.id}"
    expect(response).to have_http_status(:unauthorized)
  end

end