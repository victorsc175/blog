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
  end
end
