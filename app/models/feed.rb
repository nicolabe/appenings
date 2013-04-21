class Feed
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :user
  embeds_many :feed_events
end
