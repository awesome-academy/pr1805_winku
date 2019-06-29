class BusinessesController < ApplicationController
  before_action :check_user!, only: [:new, :create]
  def new
    @business = Business.new
  end

  def create
    @business = Business.new business_params
    if @business.save
      flash[:notice] = t("text.success")
      redirect_to root_path
    else
      flash[:alert] = t("text.fails")
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit :user_id, :page_name, :title, :website, :email, :phone_number, :address,
      :details, :social_acount1, :social_acount2, :social_acount3, :social_acount4
  end
end
