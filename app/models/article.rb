class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  
  belongs_to :user
  has_many :comments
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :img
end
