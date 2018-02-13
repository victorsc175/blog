require 'rails_helper'

describe UserPolicy do
  subject { described_class.new(user, user) }

  let(:resolved_scope) do
    described_class::Scope.new(user, User.all).resolve
  end

  let(:user) { nil }

  context 'guest creating a new user' do
    it { is_expected.to forbid_new_and_create_actions }
  end

  context 'guest accessing an existing user' do
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

  # describe 'permitted attributes for visitor' do
  # it { is_expected.to forbid_mass_assignment_of(:publish) }
  # it do
  # is_expected.to forbid_mass_assignment_of(:publish).for_action(:create)
  # end
  # it do
  # is_expected.to forbid_mass_assignment_of(:publish).for_action(:update)
  # end
  # it { is_expected.to forbid_mass_assignment_of(:slug) }
  # it { is_expected.to permit_mass_assignment_of(:slug).for_action(:create) }
  # it { is_expected.to forbid_mass_assignment_of(:slug).for_action(:update) }
  # end
end
