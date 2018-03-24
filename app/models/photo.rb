class Photo < ActiveRecord::Base
  belongs_to :game
  
  has_attached_file :image, styles: { :thumb => ["340x220#", :jpg]  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
