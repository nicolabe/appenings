class Picture
  include Mongoid::Document
  include Mongoid::Paperclip

  embedded_in :appening, :inverse_of => :pictures

  has_mongoid_attached_file :attachment,
    :styles => {
      :medium => ['250x250', :jpg]
    }
end
