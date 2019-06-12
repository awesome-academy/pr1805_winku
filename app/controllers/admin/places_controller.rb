class Admin::PlacesController < Admin::AdminController
  before_action :load_place, only: :destroy

  def index
    @places = Place.newest
  end

  def destroy
    if @place.destroy
      flash[:notice] = t("text.success")
      redirect_to admin_places_path
    else
      flash[:alert] = t("text.fails")
      redirect_to admin_places_path
    end
  end

  private

  def place_params
    params.require(:place).permit :name, :detail,
    image_attributes: [:id, :image_link, :imageable_id, :imageable_type, :_destroy]
  end

  def load_place
    @place = Place.find_by id: params[:id]
  end
end

