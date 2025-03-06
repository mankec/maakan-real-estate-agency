class PropertiesController < ApplicationController
  def index
    properties = if params[:property_type].present?
      SearchProperty.new(*params.values_at(:region, :property_type)).perform
    else
      Property.all
    end

    @properties = properties
      .order(:created_at)
      .page(params[:page])
      .per(Constants.pagination[:properties_per_page])
  end
end
