class Comment
  include Mongoid::Document
  attr_accessible :text, :author
  field :text, :type => String
  field :author, :type => String

  embedded_in :appening
end
