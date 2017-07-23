class BusinessesController < ApplicationController
  before_action :authenticate

  def index
    @businesses = Business.all
    json_response(@businesses)
  end

  def show
    @business = Business.find(params.fetch(:id))
    json_response(@business)
  end

  def random
    @business = Business.order("random()").first
    json_response(@business)
  end

  def search
    query = BusinessQuery.new(business_params)
    @businesses = query.results
    json_response(@businesses)
  end

  def create
    @business = Business.create!(business_params)
    json_response(@business, :created)
  end

  def update
    @business = Business.find(params.fetch(:id))
    if @business.update!(business_params)
      render status: 200, json: {
        message: "#{@business.name} has successfully been updated."
      }
    end
  end

  def destroy
    @business = Business.find(params.fetch(:id))
    if @business.destroy
      render status: 200, json: {
        message: "#{@business.name} has successfully been destroyed."
      }
    end
  end

  private

  def business_params
    params.permit(
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
    )
  end
end
