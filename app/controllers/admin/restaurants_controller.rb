class Admin::RestaurantsController < AdminController
  def index
    @restaurants = Restaurant.order(id: :asc).includes(:city)
  end
end
