require 'rails_helper'

RSpec.describe Mark, type: :model do
  describe 'validation' do
    it { should validate_presence_of :value }
    
    it { should validate_presence_of :user }
    
    it { should validate_presence_of :post }
    
    it { should belong_to :user }
    
    it { should belong_to :post }
    
    it 'should validate_uniqueness_of(:user).scoped_to(:post)' do
      user = FactoryGirl.create(:user)
      mark1 = Mark.create(value: 5, user: user, post: Post.first)
      mark2 = Mark.new(mark1.attributes)
      expect(mark2.valid?).to be false
    end
  end
end
