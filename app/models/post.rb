class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
    validates :user
  end
  validates :title, length: { in: 2..255 }
  belongs_to :user
end
