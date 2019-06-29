class UsersController < ApplicationController
  before_action :load_user, :check_user_block, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @status = Status.new
    @statuses = @user.statuses.newest
    @tours = @user.tours.newest
  end

  def edit; end

  def update
    if @user.update user_params
      redirect_to user_path
      flash[:success] = "Updated!!"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email,
    image_attributes: [:id, :image_link, :imageable_id, :imageable_type, :_destroy]
  end

  def load_user
    @user = User.find_by id: params[:id]
  end

  def correct_user
    if current_user =! @user
      flash[:warning] = "Oops! Not Permissions!"
      redirect_to user_path(current_user)
    end
  end

  def check_user_block
    return true if @user.unblock?
      flash[:alert] = t("text.acount_block")
      redirect_to root_path
  end
end
