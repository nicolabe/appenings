class Appening
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  validates_presence_of :title

  referenced_in :author
end
