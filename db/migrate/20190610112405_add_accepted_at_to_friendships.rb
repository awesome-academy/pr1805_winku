class AddAcceptedAtToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :accepted_at, :datetime
  end
end
