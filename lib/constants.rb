class Constants
  def self.property_types
    {
      apartment: "Apartment",
      villa: "Villa",
      townhouse: "Townhouse"
    }
  end

  def self.pagination
    {
      properties_per_page: 6
    }
  end
end
