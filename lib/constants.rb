class Constants
  def self.property_types
    {
      apartment: :apartment,
      villa: :villa
    }
  end

  def self.pagination
    {
      properties_per_page: 6
    }
  end
end
