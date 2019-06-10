class Admin::ToursController < Admin::AdminController
  def index
    @tours = Tour.all
  end
end
