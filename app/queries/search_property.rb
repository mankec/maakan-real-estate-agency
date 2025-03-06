class SearchProperty
  def initialize(region, property_type)
    @region = region
    @property_type = property_type
  end

  def perform
    properties =
      case @property_type
      when "any"
        Property.all
      else
        Property.where property_type: @property_type
      end

    if @region.present?
      properties = properties.where region: @region
    end

    properties
  end
end
