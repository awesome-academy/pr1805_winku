class StatusesController < ApplicationController
  before_action :load_status, only: [:edit, :update, :destroy]

  def create
    @status = current_user.statuses.build status_params
    if @status.save
      flash[:danger] = t("text.success")
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path)}
        format.js
      end
    else
      flash[:danger] = t("text.fails")
      redirect_to root_path
    end
  end

  def edit
    respond_to do |format|
      format.html { render :edit}
      format.js
    end
  end

  def update
    @status.update status_params
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js
    end
  end

  def destroy
    @status.destroy
    flash[:danger] = t("text.success")
    redirect_back(fallback_location: root_path)
  end

  private

  def status_params
    params.require(:status).permit :content, image_attributes: [:id,
      :image_link, :imageable_id, :imageable_type, :_destroy]
  end

  def load_status
    @status = Status.find_by id: params[:id]
  end
end
