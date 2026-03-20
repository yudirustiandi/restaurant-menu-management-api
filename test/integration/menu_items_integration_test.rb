require "test_helper"

class MenuItemsIntegrationTest < ActionDispatch::IntegrationTest
  include AuthHelper

  setup do
    @menu_item = menu_items(:one)
    @restaurant = restaurants(:one)
    @user = users(:one)
  end

  test "should get index" do
    get restaurant_menu_items_url(@restaurant), headers: auth_headers(@user)
    assert_response :success
  end

  test "should show menu item" do
    get menu_item_url(@menu_item), headers: auth_headers(@user)
    assert_response :success
  end

  test "should create menu item" do
    assert_difference("MenuItem.count") do
      post restaurant_menu_items_create_url(@restaurant), params: {
        menu_item: {
          name: "Nasi Goreng",
          description: "Enak",
          price: 20000,
          category: "Main Course",
          is_available: true,
          restaurant_id: @restaurant.id
        }
      }, headers: auth_headers(@user)
    end

    assert_response :created
  end

  test "should update menu item" do
    patch menu_item_url(@menu_item), params: {
      menu_item: { name: "Updated Menu" }
    }, headers: auth_headers(@user)

    assert_response :success
    @menu_item.reload
    assert_equal "Updated Menu", @menu_item.name
  end

  test "should destroy menu item" do
    assert_difference("MenuItem.count", -1) do
      delete menu_item_url(@menu_item), headers: auth_headers(@user)
    end

    assert_response :success
  end
end
