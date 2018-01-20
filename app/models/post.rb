class Post < ApplicationRecord
  validates :title, :body, :user, presence: true
  validates :title, length: { in: 2..255 }
  belongs_to :user
  has_many :comments
  has_many :marks
end
