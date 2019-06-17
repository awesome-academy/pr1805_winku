class Comment < ApplicationRecord
 after_commit {
    NotificationBroadcastJob.perform_later(commentable.user.id, Notification.where(send_to: commentable.user).size, self)}
  belongs_to :user
  belongs_to :commentable, polymorphic: true


  def commentable_type=(class_name)
    super(class_name.constantize.base_class.to_s)
  end


end
