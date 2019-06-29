class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @status = Status.new
    @statuses = Status.newest.unblock
    @status_edit = Status.find_by id: params[:id]
  end
end
