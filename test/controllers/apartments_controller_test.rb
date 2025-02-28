require "test_helper"
class ApartmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @apartment = apartments :one

    sign_in(users :one)
  end
  test "create apartment" do
    params = {
      apartment: {
        address: "Budhaji Nagar Kalwa",
        city: "Mumbai",
        zip_code: "10000",
        size: 1000,
        price: 100_000,
        bathroom_count: 1,
        bedroom_count: 1,
        floor: 5,
        image: fixture_file_upload("property-1.jpg", "image/jpg"),
        status: :for_sell,
        amenities: [ "Parking" ]
      }
    }

    assert_difference -> { Apartment.count } => 1 do
      post apartments_path, params: params

      assert_redirected_to Apartment.last
    end
  end

  test "update apartment's optional fields" do
    assert_equal @apartment.amenities, []

    patch apartment_path(@apartment), params: {
      apartment: {
        amenities: [ "Gym", "" ]
      }
    }
    assert_redirected_to @apartment

    @apartment.reload
    assert_equal @apartment.amenities, [ "Gym" ]
  end
end
