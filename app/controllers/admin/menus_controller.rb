class Admin::MenusController < AdminController
  def index
    @menus = Menu.all.order(id: :asc).includes(:restaurant)
  end
end
