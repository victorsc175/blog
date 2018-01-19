class Mark < ApplicationRecord
  with_options presence: true do
    validates :value
    validates :user
    validates :post
  end
  validates_uniqueness_of :user, scope: :post_id
  belongs_to :user
  belongs_to :post
end
