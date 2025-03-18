require "application_system_test_case"

class TownhousesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @townhouse = townhouses :one

    sign_in(users :one)
  end

  test "should create townhouse" do
    # TOOD Put image_file_name to Constants.rb
    image_file_name = "property-1.jpg"

    visit add_property_path
    click_on "Add Townhouse"

    fill_in "Region", with: "Townhouse Region"
    fill_in "Address", with: "New Townhouse Address"
    fill_in "City", with: "Townhouse City"
    fill_in "Zip code", with: "10000"
    fill_in "Size", with: "1000"
    fill_in "Price", with: "100000"
    attach_file(Rails.root.join("test/fixtures/files/#{image_file_name}")) do
      find("#property_image").click
    end
    click_on "Submit"

    assert_text "Townhouse was successfully created."
  end

  test "should update Townhouse" do
    visit townhouse_path @townhouse
    click_on "Edit"

    fill_in "Price", with: "200000"
    click_on "Submit"

    assert_text "Townhouse was successfully updated."
  end

  test "should destroy Townhouse" do
    visit townhouse_path @townhouse

    accept_confirm do
      click_on "Remove"
    end

    assert_text "Townhouse was successfully removed."
  end
end
