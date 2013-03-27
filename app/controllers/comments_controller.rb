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
    redirect_to appenings_path, notice: "Added comment"
  end

  def destroy
    @appening = Appening.find(params[:appening_id])
    @comment = @appening.comments.find(params[:id])
    @comment.destroy
    redirect_to appenings_path, notice: "Destroyed comment"
  end
end
