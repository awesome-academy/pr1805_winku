class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name:  User.name

  def accepted
    update accepted_at: Time.zone.now
  end
end
