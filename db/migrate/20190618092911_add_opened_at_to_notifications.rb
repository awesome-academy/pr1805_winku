class AddOpenedAtToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :opened_at, :datetime
  end
end
