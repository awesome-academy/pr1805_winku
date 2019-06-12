class AddColumToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :detail, :string
  end
end
