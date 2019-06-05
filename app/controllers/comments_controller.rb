class CommentsController < ApplicationController
  before_action :set_commentable, only: :new
  before_action :load_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new commentable: @commentable
  end

  def create
    @comment = Comment.create comment_params.merge(commentable_type: comment_params[:commentable_type].classify, user_id: current_user.id)
    @commentable = @comment.commentable
  end

  def update
    @commentable = @comment.commentable
    @comment.update comment_params
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @commentable = @comment.commentable
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :commentable_type, :commentable_id
  end

  def set_commentable
    if params[:commentable_type] == "status"
      @commentable = Status.find params[:commentable_id]
    elsif params[:commentable_type] == "tour"
      @commentable = Tour.find params[:commentable_id]
    end
  end

  def load_comment
    @comment = Comment.find params[:id]
  end
end
