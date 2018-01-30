# Blog user class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:github]
  EMAIL_MATCHER = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, presence: true,
                   length: { in: 2..26 },
                   uniqueness: true
  validates :email, presence: true,
                    length: { maximum: 255 },
                    uniqueness: true,
                    format: { with: EMAIL_MATCHER,
                              message: 'Invalid email' }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :commented_posts, through: :comments,
                             source: :commentable,
                             source_type: :Post, dependent: :destroy
  has_many :commented_users, through: :comments,
                             source: :commentable,
                             source_type: :User, dependent: :destroy
  has_one :seo, as: :seoable, dependent: :destroy
  def self.from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid
    nickname = auth.info.nickname
    user = User.find_by(provider: provider, uid: uid)
    unless user
      user = User.find_by(name: nickname)
      user.update(provider: provider, uid: uid) if user
    end
    user
  end
end
