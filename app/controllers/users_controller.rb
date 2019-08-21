class UsersController < ApplicationController
    def my_portfolio
        @user = current_user
        @user_stocks = current_user.stocks
    end

    def friends
        @friendships = current_user.friends
    end

    def search
        if params[:search].blank?
            flash.now[:danger] = "You've entered a blank search"
        else
            @users = User.search(params[:search])
            @users = current_user.except_current_user(@users)
            flash.now[:danger] = "No users found" unless @users.any?
        end

        respond_to do |format|
            format.js {render partial: 'friends/result' }
        end
    end

    def add_friend
        @friend = User.find(params[:friend])
        current_user.friendships.build(friend_id: @friend.id)
        if current_user.save
            flash[:success] = "#{@friend.first_name} added to friends."
        else
            flash[:danger] = 'There was something wrong with the request.'
        end
        redirect_to friends_path
    end
end