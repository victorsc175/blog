require 'rails_helper'

RSpec.describe Seo, type: :model do
  describe 'validation' do
    it { should validate_length_of(:title).is_at_most(160).on(:create) }

    it { should validate_length_of(:description).is_at_most(160).on(:create) }

    it { should validate_length_of(:keywords).is_at_most(160).on(:create) }

    it { should belong_to :seoable }
  end
end
