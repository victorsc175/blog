class Seo < ApplicationRecord
  validates :title, :keywords, :description, length: { maximum: 160 }
  belongs_to :seoable, polymorphic: true
end
