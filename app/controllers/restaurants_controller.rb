class RestaurantsController < ApplicationController
  before_action :set_city, only: [:show]

  def show
    @restaurant = @city.restaurants.friendly.find(params[:id])
    @menus = @restaurant.menus.order(id: :asc)
  end

  private

  def set_city
    @city = City.friendly.find(params[:city_id])
  end

  def clean_params
    params.require(:restaurant).permit(:name)
  end
end
