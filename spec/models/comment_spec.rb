require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    it { should validate_presence_of :body }
    
    it { should validate_presence_of :user }
    
    it { should validate_presence_of :post }
    
    it { should belong_to :user }
    
    it { should belong_to :post }
  end
end
