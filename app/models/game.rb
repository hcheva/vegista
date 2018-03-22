class Game < ActiveRecord::Base

  belongs_to :user
  has_many :photos
  
  validates :game_name, presence: true, length: {maximum: 75}
  validates :game_description, presence: true, length: {maximum: 140}
  validates :game_external_link, presence: true
  validates :game_genre, presence: true
  validates :game_platform, presence: true
  
  extend FriendlyId
  friendly_id :game_name, use: [:slugged, :history]
  
  
end
