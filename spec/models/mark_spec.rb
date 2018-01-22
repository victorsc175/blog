require 'rails_helper'

RSpec.describe Mark, type: :model do
  describe 'validation' do
    it { should validate_presence_of :value }

    it { should validate_presence_of :user }

    it { should validate_presence_of :post }

    it { should belong_to :user }

    it { should belong_to :post }

    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post, user: user) }
    let(:mark1) { FactoryGirl.create(:mark, user: user, post: post) }
    let(:mark2) { Mark.new(mark1.attributes) }

    it 'should validate_uniqueness_of(:user).scoped_to(:post)' do
      expect(mark2.valid?).to be false
    end
  end
end
