class AddColumToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :phone_number, :string
    add_column :businesses, :page_name, :string
    add_column :businesses, :title, :string
    add_column :businesses, :email, :string
    add_column :businesses, :social_acount1, :string
    add_column :businesses, :social_acount2, :string
    add_column :businesses, :social_acount3, :string
    add_column :businesses, :social_acount4, :string
    add_column :businesses, :social_acount5, :string
  end
end
