class User
  include Mongoid::Document
  field :username, type: String
  validates_presence_of :username

  has_many :appenings
end
