require 'rails_helper'

describe "authentication for post requests", type: :request do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:business) {FactoryGirl.create(:business)}

  it 'returns status code 422 if params passed do not meet validations' do
    post "/businesses/", params: {token: user.token}
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'returns status code 401 for an authenticated user and a post request' do
    post "/businesses/"
    expect(response).to have_http_status(:unauthorized)
  end

end