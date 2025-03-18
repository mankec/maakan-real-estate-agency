class Townhouse < ApplicationRecord
  belongs_to :property

  REQUIRED_FIELDS = [
    :bedroom_count, :bathroom_count, :floors
  ].freeze

  REQUIRED_FIELDS.each do |field|
    validates field, presence: true
  end
end
