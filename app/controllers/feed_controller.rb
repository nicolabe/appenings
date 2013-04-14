class FeedController < ApplicationController
  def show
    @appenings = current_user.feed.appenings
  end
end
