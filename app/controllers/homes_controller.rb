class HomesController < ApplicationController
  def index
    @places = Place.newest.limit(8)
    @tours = Tour.newest.limit(10)
    @users = User.newest.business
  end
end
