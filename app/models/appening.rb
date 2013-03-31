class Appening
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :accomplished, type: Boolean, default: false
  field :public, type: Boolean, default: true
  embeds_many :pictures  
  validates_presence_of :title, :user

  belongs_to :user
  embeds_many :comments
end
