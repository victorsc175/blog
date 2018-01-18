class User < ApplicationRecord
  validates :name, presence: true,
                   length: { in: 2..16 },
                   uniqueness: true
  validates :email, presence: true,
                    length: { in: 2..16 },
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                              message: 'Invalid email' }
end
