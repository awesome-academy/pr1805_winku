class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar
      t.string :role
      t.string :integer
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
