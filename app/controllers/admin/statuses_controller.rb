class Admin::StatusesController < Admin::AdminController
  before_action :load_status, only: [:show, :update, :destroy]

  def index
    @statuses = Status.all
  end

  def show
  end

  def update
    if @status.block?
      @status.update status: :unblock
    else
      @status.update status: :block
    end
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)}
      format.js
    end
  end

  def destroy
    if @status.destroy
      flash[:notice] = t("text.success")
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = t("text.fails")
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def load_status
    @status = Status.find_by id: params[:id]
  end
end
