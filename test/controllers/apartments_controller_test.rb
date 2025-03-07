require "test_helper"
class ApartmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(users :one)
  end
  test "create apartment" do
    params = {
      property: {
        region: "Apartment Region",
        address: "New Apartment Address",
        city: "Apartment City",
        zip_code: "10000",
        size: 1000,
        price: 100_000,
        image: fixture_file_upload("property-1.jpg", "image/jpg"),
        status: :for_sell,
        amenities: [ "Parking" ]
      },
      apartment: {
        bathroom_count: 1,
        bedroom_count: 1,
        floor: 5
      }
    }

    assert_difference -> { Apartment.count } => 1 do
      post apartments_path, params: params

      assert_redirected_to Apartment.last
    end
  end
end
