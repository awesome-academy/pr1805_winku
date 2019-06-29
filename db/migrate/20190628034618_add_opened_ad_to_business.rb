class AddOpenedAdToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :opened_at, :datetime
  end
end
