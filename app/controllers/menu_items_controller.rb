class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: %i[ show update destroy ]
  before_action :set_restaurant, only: [ :index, :create ]

  # GET /menu_items
  def index
    page = params[:page] || 1
    size = params[:size] || 10
    @menu_items = @restaurant.menu_items
    .by_name(params[:name])
    .by_category(params[:category])
    .order(created_at: :desc)
    .page(page)
    .per(size)

    render_success(payload: paginate(@menu_items))
  end

  # GET /menu_items/1
  def show
    render_success(payload: @menu_item)
  end

  # POST /menu_items
  def create
    @menu_item = @restaurant.menu_items.create!(menu_item_params)

    render_success(
      message: "Create success",
      payload: @menu_item,
      statusCode: :created
    )
  end

  # PATCH/PUT /menu_items/1
  def update
    @menu_item.update!(menu_item_params)

    render_success(
      message: "Update success",
      payload: @menu_item,
    )
  end

  # DELETE /menu_items/1
  def destroy
    @menu_item.destroy!

    render_success(
      message: "Delete success"
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def menu_item_params
      params.expect(menu_item: [ :name, :description, :price, :category, :is_available, :restaurant_id ])
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
