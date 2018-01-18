class Comment < ApplicationRecord
  with_options presence: true do
    validates :body
    validates :user
    validates :post
  end
  belongs_to :user
  belongs_to :post
end
