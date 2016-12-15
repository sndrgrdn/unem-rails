class Admin::MenusController < AdminController
  def index
    @menus = Menu.order(id: :asc).includes(:restaurant)
  end
end
