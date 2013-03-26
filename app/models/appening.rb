class Appening
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Commentable
  field :title, type: String
  field :body, type: String
  field :accomplished, type: Boolean, default: false
  validates_presence_of :title, :user

  belongs_to :user
end
