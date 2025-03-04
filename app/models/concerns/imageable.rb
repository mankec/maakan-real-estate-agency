module Imageable
  extend ActiveSupport::Concern

  included do
    # TODO See if this can be implemented
    # has_one_attached :video do |attachable|
    #   attachable.variant :thumb, resize_to_limit: [100, 100]
    # end
    has_one_attached :image

    validate :image_extension

    private

    def image_extension
      allowed_extensions = %w[ .jpg .jpeg .png ]

      errors.add(:base, "Please use .jpg or .png as file extension.") if image.filename.present? && allowed_extensions.exclude?(File.extname image.filename.to_s)
    end
  end
end
