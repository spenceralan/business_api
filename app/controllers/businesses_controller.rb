class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
    json_response(@businesses)
  end

  def show
    @business = Business.find(params[:id])
    json_response(@business)
  end

  def create
    @business = Business.create!(business_params)
    json_response(@business, :created)
  end

  def update
    @business = Business.find(params[:id])
    if @Business.update!(business_params)
      render status: 200, json: {
        message: "#{@business.name} has successfully been updated."
      }
    end
  end

  def destroy
    @business = Business.find(params[:id])
    if @Business.destroy
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
      :token,
    )
  end
end
