class Admin::ToursController < Admin::AdminController
  before_action :load_tour, only: [:show, :update, :destroy]

  def index
    @tours = Tour.all
  end

  def show
  end

  def update
    if @tour.block?
      @tour.update status: :unblock
    else
      @tour.update status: :block
    end
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)}
      format.js
    end
  end

  def destroy
    if @tour.destroy
      flash[:notice] = t("text.success")
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = t("text.fails")
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
  end
end
