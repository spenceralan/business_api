class Business < ApplicationRecord
  validates(
    :name,
    :phone,
    :address1,
    :city,
    :state,
    :zip,
    presence: true
  )

  scope :by_name, -> (name) { where("name ilike ?", "%#{name}%") }
  scope :by_phone, -> (phone) { where("phone ilike ?", "%#{phone}%") }
  scope :by_email, -> (email) { where("email ilike ?", "%#{email}%") }
  scope :by_twitter, -> (twitter) { where("twitter ilike ?", "%#{twitter}%") }
  scope :by_facebook, -> (facebook) { where("facebook ilike ?", "%#{facebook}%") }
  scope :by_website, -> (website) { where("website ilike ?", "%#{website}%") }
  scope :by_owner, -> (owner) { where("owner ilike ?", "%#{owner}%") }
  scope :by_address1, -> (address1) { where("address1 ilike ?", "%#{address1}%") }
  scope :by_address2, -> (address2) { where("address2 ilike ?", "%#{address2}%") }
  scope :by_city, -> (city) { where("city ilike ?", "%#{city}%") }
  scope :by_state, -> (state) { where("state ilike ?", "%#{state}%") }
  scope :by_zip, -> (zip) { where("zip ilike ?", "%#{zip}%") }

end