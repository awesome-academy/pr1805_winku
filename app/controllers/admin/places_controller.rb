class Admin::PlacesController < Admin::AdminController
  before_action :load_place, only: [:edit, :update, :destroy]

  def index
    @places = Place.newest
    @place = Place.new
  end

  def create
    @place = Place.new place_params
    if @place.save
      flash[:notice] = t("text.success")
    else
      flash[:alert] = t("text.fails")
    end
    redirect_to admin_places_path
  end

  def edit
    respond_to do |format|
      format.html { render :edit }
      format.js
    end
  end

  def update
    if @place.update place_params
      flash[:notice] = t("text.success")
    else
      flash[:alert] = t("text.fails")
    end
    redirect_to admin_places_path
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

