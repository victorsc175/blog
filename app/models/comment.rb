class Comment < ApplicationRecord
  validates :body, :user, :commentable, presence: true
  belongs_to :user, counter_cache: true
  belongs_to :commentable, polymorphic: true
end
