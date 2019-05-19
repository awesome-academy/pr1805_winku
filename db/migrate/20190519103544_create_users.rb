class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :avatar
      t.string :email
      t.integer :role
      t.references :business

      t.timestamps
    end
  end
end
