class Villa < ApplicationRecord
  include Propertiable
  include HasArrayFields
  include HasAttachedImage

  REQUIRED_FIELDS = [
    *Propertiable::REQUIRED_FIELDS, :bedroom_count, :bathroom_count
  ].freeze

  REQUIRED_FIELDS.each do |field|
    validates field, presence: true
  end
end
