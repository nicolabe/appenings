class Appening
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :accomplished, type: Boolean, default: false
  validates_presence_of :title, :user

  embedded_in :user
end
