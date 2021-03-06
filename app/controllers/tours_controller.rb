class ToursController < ApplicationController
  before_action :load_tour, only: [:edit, :show, :update, :destroy]
  before_action :check_tour_block, except: [:new, :index, :create]
  before_action :check_business!, except: [:show]

  def new
    @tour = Tour.new
  end

  def show
    interactive = Interactive.interactive_view(current_user.id, params[:id])
    Interactive.create active_id: current_user.id, passive_id: params[:id], action: :view if interactive.blank?
  end

  def create
    @tour = current_user.tours.build tour_params
    if @tour.save
      flash[:notice] = t("text.success")
      redirect_to current_user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tour.update tour_params
      flash[:notice] = t("text.success")
      redirect_to current_user
    else
      flash[:alert] = t("text.fails")
      render :edit
    end
  end

  def destroy
    @tour.destroy
    flash[:notice] = t("text.success")
    redirect_to current_user
  end

  private

  def tour_params
    params.require(:tour).permit :title, :content, :place_id, :time, :vehicle, :cost, image_attributes: [:id,
      :image_link, :imageable_id, :imageable_type, :_destroy]
  end

  def load_tour
    @tour = Tour.find_by id: params[:id]
  end

  def check_tour_block
    return true if @tour.unblock?
      flash[:alert] = t("text.tour_block")
      redirect_to root_path
  end
end
