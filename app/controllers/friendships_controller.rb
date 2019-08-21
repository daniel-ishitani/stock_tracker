class FriendshipsController < ApplicationController
    def destroy
        @friendship = current_user.friendships.where(friend_id: params[:id]).take
        @friendship.destroy
        flash[:notice] = "Friend removed."
        redirect_to friends_path
    end
end