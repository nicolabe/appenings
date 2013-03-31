class FriendsController < ApplicationController
  def index
    @friends = current_user.friends.map {|friend_id| User.find(friend_id)}
  end

  def new
    @users = User.where(:id.ne => current_user.id)

    respond_to do |format|
      format.html
    end
  end

  def add
    @friend = User.find(params[:id])
    current_user.friends << @friend.id
    current_user.save

    redirect_to friends_path, notice: "#{@friend.username} added as a friend."
  end

  def remove
    @friend = User.find(params[:id])
    current_user.friends.delete(@friend.id)
    current_user.save
    
    redirect_to friends_path, notice: "#{@friend.username} removed as friend."
  end
end
