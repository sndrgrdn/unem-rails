class Admin::MenuTypeSearchesController < AdminController
  def index
    @menu_types = MenuType.all
    @menu_type_searches = MenuTypeSearch.order(id: :asc).includes(:menu_type)
  end

  def update
    @mts = MenuTypeSearch.find params[:id]
    @mts.menu_type_id = clean_params[:menu_type_id]

    @mts.save

    redirect_to admin_menu_type_searches_path
  end

  private

  def clean_params
    params.require(:menu_type_search).permit(:menu_type_id)
  end
end
