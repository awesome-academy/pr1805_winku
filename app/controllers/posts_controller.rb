class PostsController < ApplicationController
  def create
    @post = User.first.posts.build post_params
    if @post.save
      flash[:success] = t("text.success")
      redirect_to root_path
    else
      flash[:danger] = t("text.fails")
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :category_id, :place_id
  end
end
