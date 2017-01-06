class Admin::RestaurantsController < AdminController
  def index
    @restaurants = Restaurant.order(id: :asc).includes(:city)
  end

  def edit
    @restaurant = Restaurant.friendly.find params[:id]
  end

  def update
    @restaurant = Restaurant.friendly.find params[:id]
    @restaurant.update_attributes(clean_params)
    redirect_to edit_admin_restaurant_path
  end

  private

  def clean_params
    params.require(:restaurant).permit(:name, :image, :facebook, :website)
  end
end
