class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @post = Post.new
    @posts = Post.newest
    @post_edit = Post.find_by id: params[:id]
  end
end
