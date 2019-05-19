class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :sender_id
      t.references :chatroom

      t.timestamps
    end
  end
end
