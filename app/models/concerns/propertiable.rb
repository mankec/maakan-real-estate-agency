module Propertiable
  extend ActiveSupport::Concern

  included do
    def create_property(property_params)
      property = Property.create! property_params

      property
    end
  end
end
