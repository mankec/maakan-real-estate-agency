class PropertyFactory
  def self.build(property_type)
    case property_type.to_sym
    when :apartment
      Apartment.new
    else
      raise "Unknown property type"
    end
  end
end
