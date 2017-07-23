require 'rails_helper'

describe BusinessQuery do
  it 'raises an error when receiving unexpected params' do
    expect { BusinessQuery.new({ test: "Test" }) }.to raise_error(RuntimeError)
  end

  it 'searches the database for the correct object' do
    business = FactoryGirl.create(:business)
    query = BusinessQuery.new({
      name: business.name,
      phone: business.phone,
      email: business.email,
      twitter: business.twitter,
      facebook: business.facebook,
      website: business.website,
      owner: business.owner,
      address1: business.address1,
      address2: business.address2,
      city: business.city,
      state: business.state,
      zip: business.zip,
    })
    expect(query.results.length).to eq(1)
    expect(query.results.first.name).to eq(business.name)
  end
end