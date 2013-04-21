class CommentsController < ApplicationController
  def new
    @appening = Appening.find(params[:appening_id])
    @comment = Comment.new

    respond_to do |format|
      format.js
    end
  end

  def cancel
    @appening = Appening.find(params[:appening_id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @appening = Appening.find(params[:appening_id])
    @comment = Comment.new(params[:comment])
    @comment.author = current_user.username
    @appening.comments << @comment
    title = "#{current_user.username} commented on #{@appening.user.username}'s appening \"#{@appening.title}\": "
    content = @comment.text
    feed_event = FeedEvent.create(title: title, content: content, type: "comment")
    current_user.friends.each do |friend_id|
      friend = User.find(friend_id)
      friend.feed_events << feed_event.id 
      friend.save
    end
    redirect_to appenings_path, notice: "Added comment"
  end

  def destroy
    @appening = Appening.find(params[:appening_id])
    @comment = @appening.comments.find(params[:id])
    @comment.destroy
    redirect_to appenings_path, notice: "Destroyed comment"
  end
end
