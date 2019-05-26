class StaticPagesController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.newest
    @post_edit = Post.find_by id: params[:id]
  end
end
