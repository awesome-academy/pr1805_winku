class AddColumToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :type, :string
    add_column :posts, :time, :string
    add_column :posts, :cost, :string
    add_column :posts, :vehicle, :string
  end
end
