require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation' do
    it { should validate_presence_of :title }
    
    it { should validate_presence_of :body }
    
    it { should validate_presence_of :user }
    
    it do
      should validate_length_of(:title).
      is_at_least(2).
      is_at_most(255).
      on(:create)
    end
  
    it { should belong_to :user }
    
    it { should have_many(:comments) }
    
    it { should have_many(:marks) }
  end
  
  describe 'class methods' do
    describe '.created_by' do
      it 'returns role members' do
        moderator1 = FactoryGirl.create(:user, name: 'mod1', email: 'some1@email.com', moderator: true)
        moderator2 = FactoryGirl.create(:user, name: 'mod2', email: 'some2@email.com', moderator: true)
        post1 = FactoryGirl.create(:post, user: moderator1)
        post2 = FactoryGirl.create(:post, user: moderator2, title: 'New title')
        expect(described_class.created_by(:moderator).size).to eq(2)
      end
    end
  end
end
