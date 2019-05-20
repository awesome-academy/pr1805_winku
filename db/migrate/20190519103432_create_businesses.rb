class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :address
      t.string :website
      t.string :details
      t.string :avatar

      t.timestamps
    end
  end
end
