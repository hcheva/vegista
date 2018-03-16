class Picture < ActiveRecord::Base
  belongs_to :recipe
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
