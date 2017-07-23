require 'rails_helper'

describe "get all businesses route", :type => :request do
  let!(:businesses) { FactoryGirl.create_list(:business, 20)}
  let!(:user) {FactoryGirl.create(:user)}

  before { get '/businesses', params: {token: user.token} }

  it 'returns all businesses' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end