class Villa < ApplicationRecord
  belongs_to :property

  REQUIRED_FIELDS = [
    :bedroom_count, :bathroom_count
  ].freeze
end
