# require 'rails_helper'

# describe "authentication for delete requests", type: :request do
#   let!(:user) {FactoryGirl.create(:user)}

#   it 'returns status code 200 for an authenticated user and a delete request' do
#     delete '/businesses', params: {token: user.token}
#     expect(response).to have_http_status(:success)
#   end

#   it 'returns status code 401 for an authenticated user and a delete request' do
#     delete '/businesses'
#     expect(response).to have_http_status(:unauthorized)
#   end

# end