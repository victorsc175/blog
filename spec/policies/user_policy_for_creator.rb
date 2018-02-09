require 'rails_helper'

describe UserPolicy do
  subject { described_class.new(user, user) }

  let(:resolved_scope) do
    described_class::Scope.new(user, User.all).resolve
  end

  let(:user) { creator }

  context 'creator creating a new user' do
    it { is_expected.to forbid_new_and_create_actions }
  end

  context 'creator accessing an existing user' do

    it 'includes creator in resolved scope' do
      expect(resolved_scope).to include(user)
    end
    
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

end