class PropertiesController < ApplicationController
  def index
    properties = if params[:property_type].present?
      SearchProperty.new(*params.values_at(:region, :property_type)).perform
    elsif params[:property_status].present?
      Property.where status: params[:property_status]
    else
      Property.for_sell
    end

    @properties = properties
      .order(:created_at)
      .page(params[:page])
      .per(Constants.pagination[:properties_per_page])
  end

  def search
    redirect_to properties_path(
      region: params[:region],
      property_type: params[:property_type]
    )
  end
end
