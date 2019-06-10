class Admin::UsersController < Admin::AdminController
  before_action :load_user, only: [:update, :destroy]

  def index
    @users = User.all
  end

  def update
    if @user.block?
      @user.update status: :unblock
    else
      @user.update status: :block
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
end
