class Property < ApplicationRecord
  include HasArrayFields
  include HasAttachedImage

  REQUIRED_FIELDS = %i[
    region city address zip_code size price status image
  ].freeze

  belongs_to :user

  has_one :apartment
  has_one :villa

  enum :status, %i[ for_sell for_rent ]

  (REQUIRED_FIELDS + [ :property_type ]).each do |field|
    validates field, presence: true
  end
end
