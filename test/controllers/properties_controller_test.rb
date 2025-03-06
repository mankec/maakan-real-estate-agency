require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @apartment = apartments :one
    @villa = villas :one
  end

  test "should search any property type" do
    params = { property_type: "any" }

    get search_properties_path params
    follow_redirect!
    assert_includes response.body, @apartment.property.address
    assert_includes response.body, @villa.property.address
  end

  test "should search only specific property type" do
    params = { property_type: "villa" }

    get search_properties_path params
    follow_redirect!
    assert_includes response.body, @villa.property.address
    refute_includes response.body, @apartment.property.address
  end

  test "should search by region, any property type" do
    params = {
      property_type: "any",
      region: @villa.property.region
    }

    get search_properties_path params
    follow_redirect!
    assert_includes response.body, @villa.property.address
    refute_includes response.body, @apartment.property.address
  end

  test "should search by region, specific property type" do
    another_property = @villa.property.dup
    another_property.attach_image
    another_villa = @villa.dup
    another_property.update! region: "Another Villa Region", address: "Another Villa Address"
    another_villa.update! property: another_property

    params = {
      property_type: "villa",
      region: @villa.property.region
    }
    get search_properties_path params
    follow_redirect!
    assert_includes response.body, @villa.property.address
    refute_includes response.body, another_villa.property.address
    refute_includes response.body, @apartment.property.address
  end
end
