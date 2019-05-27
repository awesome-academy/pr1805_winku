class PostsController < ApplicationController
  before_action :load_post, only: [:edit, :update, :destroy]

  def create
    @post = User.first.posts.build post_params
    if @post.save
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
    @post.update post_params
    respond_to do |format|
      format.html { redirect_back}
      format.js
    end
  end

  def destroy
    @post.destroy
    flash[:danger] = t("text.success")
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :category_id, :place_id
  end

  def load_post
    @post = Post.find_by id: params[:id]
  end
end
