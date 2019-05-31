class UsersController < ApplicationController
  before_action :correct_user , only: [:edit, :update]

  def show
    @user = User.find_by id: params[:id]
    @post = Post.new
    @posts = current_user.posts.newest
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
    params.require(:user).permit :name, :email, :avatar
  end

  def correct_user
    @user = User.find_by id: params[:id]
    if current_user =! @user
      flash[:warning] = "Oops! Not Permissions!"
      redirect_to user_path(current_user)
    end
  end
end
