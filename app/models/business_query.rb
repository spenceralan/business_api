class BusinessQuery

  attr_accessor :params 

  def initialize(query_params)
    query_params = query_params.to_hash.symbolize_keys
    self.params = query_params.extract!(
      :name,
      :phone,
      :email,
      :twitter,
      :facebook,
      :website,
      :owner,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :token,
    )

    unless query_params.empty?
      error_message = "Unexpected params included: "
      query_params.each_key { |key| error_message.concat(" #{key}") }
      raise error_message
    end

  end

  def results
    conditions = []

    if params.key? :name
      conditions << Business.where("name ilike ?", "%#{params.fetch(:name)}%")
    end

    if params.key? :phone
      conditions << Business.where("phone ilike ?", "%#{params.fetch(:phone)}%")
    end

    if params.key? :email
      conditions << Business.where("email ilike ?", "%#{params.fetch(:email)}%")
    end

    if params.key? :twitter
      conditions << Business.where("twitter ilike ?", "%#{params.fetch(:twitter)}%")
    end

    if params.key? :facebook
      conditions << Business.where("facebook ilike ?", "%#{params.fetch(:facebook)}%")
    end

    if params.key? :website
      conditions << Business.where("website ilike ?", "%#{params.fetch(:website)}%")
    end

    if params.key? :owner
      conditions << Business.where("owner ilike ?", "%#{params.fetch(:owner)}%")
    end

    if params.key? :address1
      conditions << Business.where("address1 ilike ?", "%#{params.fetch(:address1)}%")
    end

    if params.key? :address2
      conditions << Business.where("address2 ilike ?", "%#{params.fetch(:address2)}%")
    end

    if params.key? :city
      conditions << Business.where("city ilike ?", "%#{params.fetch(:name)}%")
    end

    if params.key? :state
      conditions << Business.where("state ilike ?", "%#{params.fetch(:state)}%")
    end

    if params.key? :zip
      conditions << Business.where("zip ilike ?", "%#{params.fetch(:zip)}%")
    end

    conditions.inject(Business.default_scoped, :merge)

  end

end