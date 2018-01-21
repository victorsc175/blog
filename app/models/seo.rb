class Seo < ApplicationRecord
  validates :ttle, :keywords, :description, length: { maximum: 160 }
  belongs_to :seoable, polymorphic: true
end