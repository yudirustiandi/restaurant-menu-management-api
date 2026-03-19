require "test_helper"

class RestaurantsIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference("Restaurant.count") do
      post restaurants_url, params: {
        restaurant: {
          name: "New Restaurant",
          address: "Jakarta",
          phone: "08123456789",
          opening_hours: "08:00 - 22:00"
        }
      }
    end

    assert_response :created
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: {
      restaurant: { name: "Updated Name" }
    }

    assert_response :success
    @restaurant.reload
    assert_equal "Updated Name", @restaurant.name
  end

  test "should destroy restaurant" do
    @restaurant.menu_items.destroy_all
    assert_difference("Restaurant.count", -1) do
      delete restaurant_url(@restaurant)
    end

    assert_response :success
  end
end
