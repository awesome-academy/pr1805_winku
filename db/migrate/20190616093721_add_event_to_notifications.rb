class AddEventToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :event, :string
  end
end
