require 'rails_helper'

describe Business do
  it 'creates a new user' do
    user = User.create
    expect(user.id).to match(UUID)
  end
end