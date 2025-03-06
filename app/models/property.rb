class Property
  def self.all(*cols)
    cols.prepend(:id) if cols.exclude? :id
    cols.prepend(:property_type) if cols.exclude? :property_type

    Apartment.select(*cols)
    .from(
      "(#{union_query(cols)}) AS properties"
    )
  end

  private

  def self.union_query(cols)
    Constants.property_types.values.map do |property_type|
      "SELECT #{cols.join(", ")} FROM #{property_type.pluralize}"
    end
      .join(" UNION ")
  end
end
