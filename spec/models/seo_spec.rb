require 'rails_helper'

RSpec.describe Seo, type: :model do
  describe 'validation' do
    it { should validate_length_of(:title).is_at_most(160).on(:create) }

    it { should validate_length_of(:description).is_at_most(160).on(:create) }

    it { should validate_length_of(:keywords).is_at_most(160).on(:create) }

    it { should belong_to :seoable }

    let(:user) { FactoryGirl.create(:user) }
    let(:seo1) { FactoryGirl.create(:seo, seoable: user) }
    let(:seo2) { Seo.new(seo1.attributes) }

    it 'should validate_uniqueness of seoable' do
      expect(seo2.valid?).to be false
    end
  end
end
