require "test_helper"

class VillasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @villa = villas :one

    sign_in(users :one)
  end

  test "should get index" do
    get villas_path

    assert_response :success
  end

  test "should get new" do
    get new_villa_path

    assert_response :success
  end

  test "should create villa" do
    params = {
      villa: {
        address: "New Villa Address",
        city: "Kolkata",
        zip_code: "10000",
        size: 1000,
        price: 100_000,
        bathroom_count: 1,
        bedroom_count: 1,
        image: fixture_file_upload("property-1.jpg", "image/jpg"),
        status: :for_sell,
        amenities: [ "Parking" ]
      }
    }

    assert_difference -> { Villa.count } => 1 do
      post villas_path, params: params
    end

    assert_redirected_to Villa.last
  end

  test "should show villa" do
    get villa_path @villa

    assert_response :success
  end

  test "should get edit" do
    get edit_villa_path @villa
    assert_response :success
  end

  test "should update villa" do
    patch villa_path(@villa), params: { villa: { price: 200_000 } }
    assert_redirected_to @villa
  end

  test "should destroy villa" do
    assert_difference("Villa.count", -1) do
      delete villa_path @villa
    end

    assert_redirected_to villas_path
  end
end
