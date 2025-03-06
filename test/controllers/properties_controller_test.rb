require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @apartment = apartments :one
    @villa = villas :one
  end

  test "should search any property type" do
    get search_property_path(params: {
      property_type: "any"
    })
    assert_redirected_to properties_path(property_type: "any")

    follow_redirect!
    assert_includes response.body, @apartment.property.address
    assert_includes response.body, @villa.property.address
  end

  test "should search only specific property type" do
    get search_property_path(params: {
      property_type: "villa"
    })
    assert_redirected_to properties_path(property_type: "villa")

    follow_redirect!
    assert_includes response.body, @villa.property.address
    refute_includes response.body, @apartment.property.address
  end

  test "should search by region, any property type" do
    get search_property_path(params: {
      property_type: "any",
      region: @villa.property.region
    })
    assert_redirected_to properties_path(property_type: "any", region: @villa.property.region)

    follow_redirect!
    assert_includes response.body, @villa.property.address
    refute_includes response.body, @apartment.property.address
  end

  test "should search by region, specific property type" do
    image_file_name = "property-1.jpg"

    another_property = @villa.property.dup
    # TODO Put in a helper called attach_image
    another_property.image.attach(
      io: File.open(Rails.root.join "test/fixtures/files/#{image_file_name}"),
      filename: image_file_name
    )
    another_villa = @villa.dup
    another_property.update! region: "Another Villa Region", address: "Another Villa Address"
    another_villa.update! property: another_property

    params = {
      property_type: "villa",
      region: @villa.property.region
    }
    get search_property_path params: params
    assert_redirected_to properties_path(params)

    follow_redirect!
    assert_includes response.body, @villa.property.address
    refute_includes response.body, another_villa.property.address
    refute_includes response.body, @apartment.property.address
  end
end
