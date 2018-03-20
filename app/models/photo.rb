class Photo < ActiveRecord::Base
  belongs_to :game
  
  has_attached_file :image, styles: { medium: "340x220#", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
