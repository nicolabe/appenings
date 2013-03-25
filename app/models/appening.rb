class Appening
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  validates_presence_of :title

  has_one :user
end
