class PlacesController < ApplicationController
  def show
    @place = Place.find_by id: params[:id]
    @tours = @place.posts
  end
end
