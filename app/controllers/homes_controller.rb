class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @places = Place.newest.limit(8)
    @tours = Tour.newest.limit(10)
    @users = User.newest.business
  end
end
