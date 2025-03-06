class Search
  def initialize(region, zip_code, property_type)
    @query = query
    @property_type = "any" || property_type
  end

  def perform
    properties =
      case @property_type
      when "any"
        Property.all(:city, :zip_code, :address)
      else
        property = property_type.constantize

        property.select("id, property_type, city, zip_code, address")
      end

    properties
  end

  private

  def properties_where_query
    keywords = query.split

    keywords.map do |keyword|
      "address LIKE ?, #{keyword}"
    end
  end
end
