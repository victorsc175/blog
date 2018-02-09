# Blog post class
class Post < ApplicationRecord
  validates :title, :body, :user, presence: true
  validates :title, length: { in: 2..255 }
  belongs_to :user, counter_cache: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :commentators, through: :comments, source: :user, dependent: :destroy
  has_one :seo, as: :seoable, dependent: :destroy
  scope :published, -> { where(disactive: false) }
  scope :created_by, ->(role) { joins(:user).where(users: { role => true }) }
end
