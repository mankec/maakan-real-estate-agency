class Villa < ApplicationRecord
  REQUIRED_FIELDS = %i[
    address city zip_code size price bedroom_count bathroom_count image status
  ].freeze
  NON_REQUIRED_FIELDS = %i[ amenities ].freeze
  FIELDS = REQUIRED_FIELDS + NON_REQUIRED_FIELDS

  enum :status, %i[ for_sell for_rent ], prefix: "villa"

  has_one_attached :image
  belongs_to :user

  REQUIRED_FIELDS.each do |field|
    validates field, presence: true
  end

  validate :image_extension

  private

  def image_extension
    allowed_extensions = %w[.jpg .jpeg .png]

    errors.add(:base, "Please use .jpg or .png as file extension.") if allowed_extensions.exclude?(File.extname image.filename.to_s)
  end
end
