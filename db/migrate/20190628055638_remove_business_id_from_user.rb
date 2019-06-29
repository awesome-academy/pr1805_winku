class RemoveBusinessIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :business_id, :integer
  end
end
