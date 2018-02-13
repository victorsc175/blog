require 'rails_helper'

describe PostPolicy do
  subject { described_class.new(user, post) }

  let(:resolved_scope) do
    described_class::Scope.new(user, Post.all).resolve
  end

  let(:user) { FactoryGirl.create(:user) }
  let(:author) { creator }

  context 'user creating a new post' do
    let(:post) { FactoryGirl.create(:post, user: author) }

    it { is_expected.to forbid_new_and_create_actions }
  end

  context 'user accessing a published post' do
    let(:post) { FactoryGirl.create(:post, user: author) }

    it 'includes post in resolved scope' do
      expect(resolved_scope).to include(post)
    end

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'user accessing an unpublished post' do
    let(:post) { FactoryGirl.create(:post, user: author, disactive: true) }

    it 'excludes post from resolved scope' do
      expect(resolved_scope).not_to include(post)
    end

    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_action(:destroy) }
  end
end
