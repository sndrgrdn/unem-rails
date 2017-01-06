class Admin::MenusController < AdminController
  def index
    @menus = Menu.order(id: :asc).includes(:restaurant)
  end

  def show
    @menu = Menu.includes(dishes: :ingredients).friendly.find params[:id]
  end
end
