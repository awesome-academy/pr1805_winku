class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :send_to_id
      t.integer :send_to_type
      t.integer :send_from_id
      t.string :send_from_type
      t.references :post
      t.references :report
      t.references :comment
      t.integer :status

      t.timestamps
    end
  end
end
