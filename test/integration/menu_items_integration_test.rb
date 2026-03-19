require "test_helper"

class MenuItemsIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @menu_item = menu_items(:one)
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurant_menu_items_url(@restaurant)
    assert_response :success
  end

  test "should show menu item" do
    get menu_item_url(@menu_item)
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
      }
    end

    assert_response :created
  end

  test "should update menu item" do
    patch menu_item_url(@menu_item), params: {
      menu_item: { name: "Updated Menu" }
    }

    assert_response :success
    @menu_item.reload
    assert_equal "Updated Menu", @menu_item.name
  end

  test "should destroy menu item" do
    assert_difference("MenuItem.count", -1) do
      delete menu_item_url(@menu_item)
    end

    assert_response :success
  end
end
