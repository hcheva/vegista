class Recipe < ActiveRecord::Base
  belongs_to :user
  has_one :pictures
  
  validates :recipe_name, presence: true, length: {maximum: 75}
  validates :recipe_external_link, presence: true
  validates :recipe_category, presence: true
  validates :recipe_description, presence: true, length: {maximum: 140}
  
end
