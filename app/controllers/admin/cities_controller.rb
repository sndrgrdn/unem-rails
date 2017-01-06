class Admin::CitiesController < AdminController
  def index
    @cities = City.order(id: :asc)
  end

  def edit
    @city = City.friendly.find params[:id]
  end

  def update
    @city = City.friendly.find(params[:id]).update_attributes(clean_params)
    redirect_to admin_cities_path
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create(clean_params)
    redirect_to admin_cities_path
  end

  def destroy
    City.friendly.find(params[:id]).destroy
    redirect_to admin_cities_path
  end

  private

  def clean_params
    params.require(:city).permit(:name)
  end
end
