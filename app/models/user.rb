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
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    where(name: auth.info.nickname).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      p auth.info
      # user.name = auth.info.email
      # user.email = auth.info.email
      # user.password = Devise.friendly_token[0,20]
    end
  end
end
