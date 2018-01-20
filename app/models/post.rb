class Post < ApplicationRecord
  validates :title, :body, :user, presence: true
  validates :title, length: { in: 2..255 }
  belongs_to :user, counter_cache: true
  has_many :comments, as: :commentable
  has_many :marks
  has_many :commentators, through: :comments, source: :user
end
