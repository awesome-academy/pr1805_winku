class ApplicationController < ActionController::Base
  before_action :set_locale
  include ApplicationHelper
  before_action :authenticate_user!
  before_action :set_notification

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_notification
    @notifications = Notification.where(send_to: current_user)
  end

  private

  def default_url_options
    {locale: I18n.locale}
  end
end
