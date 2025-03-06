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

  def search
    redirect_to properties_path(
      region: params[:region],
      property_type: params[:property_type]
    )
  end
end
