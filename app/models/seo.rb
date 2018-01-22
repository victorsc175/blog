# Blog seo class
class Seo < ApplicationRecord
  validates :title, :keywords, :description, length: { maximum: 160 }
  belongs_to :seoable, polymorphic: true
  validates_uniqueness_of :seoable_id, scope: :seoable_type
end
