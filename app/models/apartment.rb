class Apartment < ApplicationRecord
  belongs_to :property

  REQUIRED_FIELDS = [
    :bedroom_count, :bathroom_count, :floor
  ].freeze

  REQUIRED_FIELDS.each do |field|
    validates field, presence: true
  end
end
