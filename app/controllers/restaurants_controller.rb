class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show update destroy ]

  # GET /restaurants
  def index
    page = params[:page] || 1
    size = params[:size] || 10
    @restaurants = Restaurant.order(created_at: :desc).page(page).per(size)

    render_success(payload: paginate(@restaurants))
  end

  # GET /restaurants/1
  def show
    render_success(payload: @restaurant.as_json(include: :menu_items))
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.create!(restaurant_params)

    render_success(
      message: "Create success",
      payload: @restaurant,
      statusCode: :created
    )
  end

  # PATCH/PUT /restaurants/1
  def update
    @restaurant.update!(restaurant_params)
    render_success(
      message: "Update success",
      payload: @restaurant
    )
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy!

    render_success(
      message: "Delete success"
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.includes(:menu_items).find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.expect(restaurant: [ :name, :address, :phone, :opening_hours ])
    end
end
