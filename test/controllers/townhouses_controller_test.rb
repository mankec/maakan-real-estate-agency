require "test_helper"

class TownhousesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @townhouse = townhouses :one

    sign_in(users :one)
  end

  test "should get index" do
    get townhouses_path

    assert_response :success
  end

  test "should get new" do
    get new_townhouse_path

    assert_response :success
  end

  test "should create townhouse" do
    params = {
      property: {
        region: "Townhouse Region",
        address: "New Townhouse Address",
        city: "Townhouse City",
        zip_code: "10000",
        size: 1000,
        price: 100_000,
        image: fixture_file_upload("property-1.jpg", "image/jpg"),
        status: :for_sell,
        amenities: [ "Pool" ]
      },
      townhouse: {
        bathroom_count: 1,
        bedroom_count: 1,
        floors: 2
      }
    }

    assert_difference -> { Townhouse.count } => 1 do
      post townhouses_path, params: params
    end

    assert_redirected_to Townhouse.last
  end

  test "should show townhouse" do
    get townhouse_path @townhouse

    assert_response :success
  end

  test "should get edit" do
    get edit_townhouse_path @townhouse
    assert_response :success
  end

  test "should update townhouse" do
    patch townhouse_path(@townhouse), params: { townhouse: { bathroom_count: 3 } }
    assert_redirected_to @townhouse
  end

  test "should destroy townhouse" do
    assert_difference("Townhouse.count", -1) do
      delete townhouse_path @townhouse
    end

    assert_redirected_to townhouses_path
  end
end
