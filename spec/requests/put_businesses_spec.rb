# require 'rails_helper'

# describe "authentication for put requests", type: :request do
#   let!(:user) {FactoryGirl.create(:user)}

#   it 'returns status code 200 for an authenticated user and a put request' do
#     put '/businesses', params: {token: user.token}
#     expect(response).to have_http_status(:success)
#   end

#   it 'returns status code 401 for an authenticated user and a put request' do
#     put '/businesses'
#     expect(response).to have_http_status(:unauthorized)
#   end

# end