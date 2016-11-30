class StaticPagesController < ApplicationController
  def home
    @restaurants = Restaurant.includes(:city).order("RANDOM()").limit(50)
  end
end
