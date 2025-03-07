require "application_system_test_case"

class VillasTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @villa = villas :one

    sign_in(users :one)
  end

  test "should create villa" do
    # TOOD Put image_file_name to Constants.rb
    image_file_name = "property-1.jpg"

    visit add_property_path
    click_on "Add Villa"

    fill_in "Region", with: "Villa Region"
    fill_in "Address", with: "New Villa Address"
    fill_in "City", with: "Villa City"
    fill_in "Zip code", with: "10000"
    fill_in "Size", with: "1000"
    fill_in "Price", with: "100000"
    attach_file(Rails.root.join("test/fixtures/files/#{image_file_name}")) do
      find("#property_image").click
    end
    click_on "Submit"

    assert_text "Villa was successfully created."
  end

  test "should update Villa" do
    visit villa_path @villa
    click_on "Edit"

    fill_in "Price", with: "200000"
    click_on "Submit"

    assert_text "Villa was successfully updated."
  end

  test "should destroy Villa" do
    visit villa_path @villa

    accept_confirm do
      click_on "Remove"
    end

    assert_text "Villa was successfully removed."
  end
end
