module ApplicationHelper

  def places
    @place_options = Place.newest.pluck :name, :id
  end

  def current_user? user
    current_user == user
  end

  def places_newest
    query = Tour.select("place_id, COUNT(id) as post_count").group("place_id").order("post_count desc")
    @places = Place.joins("right JOIN (#{query.to_sql}) sub on places.id = sub.place_id").limit(4)
  end

  def bussinesses
    @users = User.newest.business
  end
end
