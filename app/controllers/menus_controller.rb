class MenusController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def show
    @menu = @restaurant.menus.friendly.find(params[:id])
    @dishes = @menu.dishes.order(id: :asc).includes(:ingredients).order('ingredients.id')
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
  end
end
