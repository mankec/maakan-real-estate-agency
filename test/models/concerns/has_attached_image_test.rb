require "test_helper"

class HasAttachedImageTest < ActiveSupport::TestCase
  setup do
    @property = properties :property_apartment
  end

  test "should attach new image" do
    image_file_name = "property-1.jpg"
    new_image_file_name = "property-2.jpg"

    assert_equal @property.image.filename.to_s, image_file_name

    @property.image.attach(
      io: File.open(Rails.root.join "test/fixtures/files/#{new_image_file_name}"),
      filename: new_image_file_name
    )
    assert_equal @property.image.filename.to_s, new_image_file_name
  end

  test "should disallow wrong image extension" do
    image_file_name = "invalid_image_file.pdf"

    @property.image.attach(
      io: File.open(Rails.root.join "test/fixtures/files/#{image_file_name}"),
      filename: image_file_name
    )
    assert_equal(
      @property.errors.full_messages.first,
      "Please use .jpg or .png as file extension."
    )
  end
end
