module ApplicationHelper

  def places
    @place_options = Place.newest.pluck :name, :id
  end

  def current_user? user
    current_user == user
  end

  def places_newest
    query = Tour.select("place_id, COUNT(id) as post_count").group("place_id").order("post_count desc")
    @places = Place.joins("right JOIN (#{query.to_sql}) sub on places.id = sub.place_id").limit(8)
  end

  def bussinesses
    @users = User.newest.business
  end

  def check_business!
    return true if current_user.business?
      flash[:alert] = t("text.not_business")
      redirect_to root_path
  end
end
