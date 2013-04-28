class FeedEvent
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type, type: String
  field :content, type: String
  belongs_to :user

  TYPES = ["appening", "comment", "picture"]
end
