class SearchController < ApplicationController

  def restaurants
    if clean_params[:q].empty?
      @restaurants = Restaurant.includes(:city).sample(50)
    else
      @restaurants = Restaurant.fuzzy_search(name: clean_params[:q]).includes(:city)
    end
  end

  def city_restaurants
    if clean_params[:q].empty?
      @restaurants = Restaurant.where(city_id: clean_params[:id]).includes(:city)
    else
      @restaurants = Restaurant.fuzzy_search(name: clean_params[:q]).where(city_id: clean_params[:id]).includes(:city)
    end
  end

  private

  def clean_params
    params.permit(
      q: Parameters.string,
      id: Parameters.integer
    )
  end
end
