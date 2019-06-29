module Admin::BusinessesHelper
  def noti_business
    @businesses = Business.not_opened.limit(8)
  end

  def count_noti_business
    @count = Business.not_opened.size
  end
end
