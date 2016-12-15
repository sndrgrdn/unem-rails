class Admin::RestaurantsController < AdminController
  def index
    @restaurants = Restaurant.all.order(id: :asc).includes(:city)
  end
end
