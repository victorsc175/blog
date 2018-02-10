require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { described_class.new name: 'Some Name', email: 'some@email.com' }

    it { should validate_presence_of :name }

    it { should validate_uniqueness_of :name }

    it do
      should validate_length_of(:name)
        .is_at_least(2)
        .is_at_most(26)
        .on(:create)
    end

    it { should validate_presence_of :email }

    it do
      should validate_length_of(:email)
        .is_at_most(255)
        .on(:create)
    end

    it { should allow_value('some@mail.com').for(:email) }

    it { should_not allow_value('somemail.com').for(:email) }

    it { should have_many(:posts) }

    it { should have_many(:comments) }

    it { should have_many(:marks) }
  end
  
  let(:github_nick) { 'github_nick' }
  let(:user) { FactoryGirl.create(:user, name: github_nick) }
  
  describe '.from_omniauth' do
    it 'returns user' do
      allow(described_class).to receive(:from_omniauth) { user }
      expect(described_class.from_omniauth(:auth)).to eq(user)
    end
  end
end
