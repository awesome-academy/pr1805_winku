class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find_by id: params[:id]
    @status = Status.new
    @statuses = current_user.statuses.newest
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

  def correct_user
    @user = User.find_by id: params[:id]
    if current_user =! @user
      flash[:warning] = "Oops! Not Permissions!"
      redirect_to user_path(current_user)
    end
  end
end
