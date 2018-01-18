class Mark < ApplicationRecord
  with_options presence: true do
    validates :value
    validates :user
    validates :post
  end
  validates :user, uniqueness: { scope: :post }
  belongs_to :user
  belongs_to :post
end
