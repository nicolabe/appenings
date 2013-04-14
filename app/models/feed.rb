class Feed
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  embeds_many :appenings
end
