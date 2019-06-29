class Admin::HomesController < Admin::AdminController
  def index
    @users = User.all
    @statuses = Status.all
    @tours = Tour.all
  end
end
