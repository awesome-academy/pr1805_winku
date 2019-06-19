class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @tours = Tour.newest.limit(10)
    @q = Tour.ransack(params[:q])
    @tours_search = @q.result
  end
end
