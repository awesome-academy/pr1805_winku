module ApplicationHelper
  def places
    @place_options = Place.newest.pluck :name, :id
  end
end
