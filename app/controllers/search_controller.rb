class SearchController < ApplicationController

  def restaurants
    @restaurants = Restaurant.fuzzy_search(name: clean_params[:q]).includes(:city)
  end

  private

  def clean_params
    params.permit(
      q: Parameters.string
    )
  end
end
