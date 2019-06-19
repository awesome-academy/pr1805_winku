class PlacesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @place = Place.find_by id: params[:id]
    @tours = @place.posts
    @q = @place.posts.ransack(params[:q])
    @tours_search = @q.result
  end
end
