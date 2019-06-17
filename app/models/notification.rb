class Notification < ApplicationRecord
  after_create_commit {
    NotificationBroadcastJob.perform_later(Notification.count, self)}
  belongs_to :report, dependent: :destroy, optional: true
  belongs_to :post, dependent: :destroy,  optional: true
  belongs_to :comment, dependent: :destroy, optional: true
  belongs_to :send_from, class_name: User.name
  belongs_to :send_to, class_name: User.name

  scope :newest, -> { where opened_at: nil }

end
