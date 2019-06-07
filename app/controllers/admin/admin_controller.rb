class Admin::AdminController < ApplicationController
  layout "admin/application"
  before_action :set_locale, :ensure_admin!

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def ensure_admin!
    if current_user.admin?
      flash[:notice] = t("text.success")
      return true
    else
      flash[:alert] = t("text.not_admin")
      redirect_to root_path
    end
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
