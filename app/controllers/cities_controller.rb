class CitiesController < ApplicationController
  def index
    @cities = City.all.includes(:restaurants)
  end

  def show
    @city = City.friendly.find(params[:id])
    @restaurants = @city.restaurants
  end

  private

  def clean_params
    params.require(:city).permit(:name)
  end
end
