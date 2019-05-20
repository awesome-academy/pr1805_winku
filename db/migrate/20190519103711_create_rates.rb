class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :star
      t.string :review
      t.references :post
      t.references :user

      t.timestamps
    end
  end
end
