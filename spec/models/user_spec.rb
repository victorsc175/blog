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

  let(:provider) { 'github' }
  let(:uid) { '123545' }
  let(:nickname) { 'nickname' }

  before do
    OmniAuth.config.test_mode = true
  end

  describe '#from_omniauth' do
    let!(:github_user) do
      FactoryGirl.create(:user, provider: provider,
                                uid: uid, name: nickname)
    end
    let(:github_oauth) { OmniAuth.config.mock_auth[:github] }

    it 'returns oauth data for OAuth response for first request' do
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(provider: '',
                                                                  uid: '',
                                                                  info: { nickname: nickname })
      data = described_class.from_omniauth(github_oauth)
      expect(data[:name]).to eq(nickname)
    end

    it 'returns oauth data for OAuth response with stored parameters' do
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(provider: provider,
                                                                  uid: uid,
                                                                  info: { nickname: nickname })
      data = described_class.from_omniauth(github_oauth)
      expect(data[:provider]).to eq(provider)
      expect(data[:uid]).to eq(uid)
    end
  end
end
