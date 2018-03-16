class Recipe < ActiveRecord::Base
  belongs_to :user
  
  validates :recipe_name, presence: true, lenght: {maximum: 75}
  validates :recipe_external_link, presence: true
  validates :recipe_category, presence: true
  validates :recipe_description, presence: true, lenght: {maximum: 140}
  
end
