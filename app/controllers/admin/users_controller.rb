class Admin::UsersController < Admin::AdminController
  before_action :load_user, only: [:show, :update, :destroy]
  before_action :check_user, only: :show

  def index
    @users = User.all
  end

  def show
    @user.business.update opened_at: Time.now
  end

  def update
    if params[:role]
      @user.update role: params[:role]
    else
      if @user.block?
        @user.update status: :unblock
      else
        @user.update status: :block
      end
    end
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)}
      format.js
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = t("text.success")
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = t("text.fails")
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
  end

  def check_user
    return true if @user.business.present?
      flash[:alert] = t("text.not_business")
      redirect_back(fallback_location: root_path)
  end
end
