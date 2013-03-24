class User
  include Mongoid::Document
  field :username, type: String
  validates_presence_of :username

  references_many :appenings
end
