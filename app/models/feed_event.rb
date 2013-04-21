class FeedEvent
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type, type: String
  field :title, type: String
  field :content, type: String

  TYPES = ["appening", "comment", "picture"]
end
