require "test_helper"

class HasAttachedImageTest < ActiveSupport::TestCase
  setup do
    @property = properties :property_apartment
  end

  test "should attach new image" do
    image_filename = "property-1.jpg"
    new_image_filename = "property-2.jpg"

    assert_equal @property.image.filename.to_s, image_filename

    @property.attach_image(new_image_filename)
    assert_equal @property.image.filename.to_s, new_image_filename
  end

  test "should disallow wrong image extension" do
    @property.attach_image("invalid_image_file.pdf")
    assert_equal(
      @property.errors.full_messages.first,
      "Please use .jpg or .png as file extension."
    )
  end
end
