class ToursController < ApplicationController
  before_action :load_tour, only: [:edit, :update, :destroy]

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = current_user.tours.build tour_params
    if @tour.save
      flash[:danger] = t("text.success")
      redirect_to tours_path
    else
      flash[:danger] = t("text.fails")
      redirect_to tours_path
    end
  end

  private

  def tour_params
    params.require(:tour).permit :title, :content, :place_id, :time, :vehicle, :cost, image_attributes: [:id,
      :image_link, :imageable_id, :imageable_type, :_destroy]
  end

  def load_tour
    @tour = Tour.find_by id: params[:id]
  end
end
