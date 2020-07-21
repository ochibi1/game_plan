class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :aticle
  validates :text, presence: true
end
