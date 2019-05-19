class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :sender_id
      t.integer :received_id
      t.integer :status
      t.datetime :opened_at

      t.timestamps
    end
  end
end
