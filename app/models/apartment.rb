class Apartment < ApplicationRecord
  has_one :property, as: :propertyable
end
