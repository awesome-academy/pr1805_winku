class Admin::StatusesController < Admin::AdminController
  def index
    @statuses = Status.all
  end
end
