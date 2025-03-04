class Apartment < ApplicationRecord
  include Propertiable
  include Imageable
  include HasArrayFields

  REQUIRED_FIELDS = [
    *Propertiable::REQUIRED_FIELDS,
    :bedroom_count, :bathroom_count, :floor
  ].freeze

  REQUIRED_FIELDS.each do |field|
    validates field, presence: true
  end
end
