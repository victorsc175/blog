require 'spec_helper'

describe CallbacksController, 'handle github authentication callback' do
  let(:provider) { 'github' }
  let(:uid) { '123545' }
  let(:nickname) { 'nickname' }
  let!(:github_user) do
    FactoryGirl.create(:user, provider: provider,
                              uid: uid, name: nickname, email: 'user@github.com')
  end
  let(:github_oauth) { OmniAuth.config.mock_auth[:github] }

  describe 'github auth' do
    OmniAuth.config.test_mode = true

    it 'does auth and redirect' do
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(provider: '',
                                                                  uid: '',
                                                                  info: { nickname: nickname })
      request.env['devise.mapping'] = Devise.mappings[:user]
      request.env['omniauth.auth'] = github_oauth
      get :github
      expect(response).to redirect_to('/')
    end
  end
end
