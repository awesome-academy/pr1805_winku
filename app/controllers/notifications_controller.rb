class NotificationsController < ApplicationController
  def index
    @notifications = Notification.newest.reverse
  end

end
