require 'rails_helper'

describe "error when attempting unrecognized route", type: :request do
  let!(:user) {FactoryGirl.create(:user)}

  it 'returns status code 404 for an authenticated user and an unrecognized request' do
    get '/not_a_route', params: {token: user.token}
    expect(response.message).to eq("Not Found")
    expect(response).to have_http_status(:not_found)
  end

  it 'returns status code 404 for an unauthenticated user and an unrecognized request' do
    get '/not_a_route'
    expect(response).to have_http_status(:not_found)
  end

end