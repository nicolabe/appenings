class FeedController < ApplicationController
  def show
    @feed_entries = current_user.feed_events.map {|event_id| FeedEvent.find(event_id)}
  end

  def remove
    current_user.events.delete(params[:appening_id])
    redirect_to feed_path, notice: "Removed appening."
  end
end
