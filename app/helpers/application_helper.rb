module ApplicationHelper

  def places
    @place_options = Place.newest.pluck :name, :id
  end

  def current_user? user
    current_user == user
  end
end
