module Propertiable
  extend ActiveSupport::Concern

  REQUIRED_FIELDS = %i[
    address city zip_code size price status image
  ].freeze

  included do
    belongs_to :user

    enum :status, %i[ for_sell for_rent ], prefix: self.name.downcase
  end
end
