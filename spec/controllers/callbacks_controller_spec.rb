require 'spec_helper'

describe CallbacksController, "handle github authentication callback" do

    context "when github nick doesn't exist in the system" do
      before(:each) do
        request.env["devise.mapping"] = Devise.mappings[:user]
        request.env["omniauth.auth"] = { "provider" => "github", "uid" => "1234",
          "extra" => { "user_hash" => { "name" => "github_nick", "email" => "ghost@nobody.com" } } }
        allow(controller).to receive(:github)
      end
      
      let(:user) { User.find_by(name: "github_nick") }

      it 'does not return user' do
        expect(user).not_to be
      end
      
      it { should_not be_user_signed_in }
      
      it 'renders login page' do
        expect(response).to be_success
      end 
    end

    context "when github nick already exist in the system" do
      let(:github_nick) { 'github_nick' }
      let(:user) { FactoryGirl.create(:user, name: github_nick) }
      before(:each) do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = { "provider" => "github", "uid" => "1234",
          "info" => { "nickname" => github_nick } }
        allow(controller).to receive(:current_user) { user }
        allow(controller).to receive(:github) { user }
      end
      
      it 'does not return user' do
        expect(user).to be
      end
      
      it { should be_user_signed_in }
    end
end
