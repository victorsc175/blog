require 'rails_helper'

describe UserPolicy do
  subject { described_class.new(user, user) }

  let(:resolved_scope) do
    described_class::Scope.new(user, User.all).resolve
  end

  let(:user) { moderator }

  context 'moderator creating a new user' do
    it { is_expected.to permit_new_and_create_actions }
  end

  context 'moderator accessing an existing user' do

    it 'includes moderator in resolved scope' do
      expect(resolved_scope).to include(user)
    end
    
    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_action(:destroy) }
  end

end