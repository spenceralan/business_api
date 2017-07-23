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
      conditions << Business.by_name(params.fetch(:name))
    end

    if params.key? :phone
      conditions << Business.by_phone(params.fetch(:phone))
    end

    if params.key? :email
      conditions << Business.by_email(params.fetch(:email))
    end

    if params.key? :twitter
      conditions << Business.by_twitter(params.fetch(:twitter))
    end

    if params.key? :facebook
      conditions << Business.by_facebook(params.fetch(:facebook))
    end

    if params.key? :website
      conditions << Business.by_website(params.fetch(:website))
    end

    if params.key? :owner
      conditions << Business.by_owner(params.fetch(:owner))
    end

    if params.key? :address1
      conditions << Business.by_address1(params.fetch(:address1))
    end

    if params.key? :address2
      conditions << Business.by_address2(params.fetch(:address2))
    end

    if params.key? :city
      conditions << Business.by_city(params.fetch(:city))
    end

    if params.key? :state
      conditions << Business.by_state(params.fetch(:state))
    end

    if params.key? :zip
      conditions << Business.by_zip(params.fetch(:zip))
    end

    conditions.inject(Business.default_scoped, :merge)

  end

end