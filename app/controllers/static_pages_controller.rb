class StaticPagesController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.newest
  end
end
