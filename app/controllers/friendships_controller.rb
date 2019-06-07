class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @friendship.save
    @friend = User.find(params[:friend_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friend = User.find(params[:friend_id])
    @friendship.destroy
    respond_to do |format|
      format.js
    end
  end
end
