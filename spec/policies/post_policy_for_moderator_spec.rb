require 'rails_helper'

describe PostPolicy do
  subject { described_class.new(user, post) }

  let(:resolved_scope) do
    described_class::Scope.new(user, Post.all).resolve
  end

  let(:user) { moderator }
  let(:author) { FactoryGirl.create(:user) }

  context 'moderator creating a new post' do
    let(:post) { FactoryGirl.create(:post, user: author) }

    it { is_expected.to permit_new_and_create_actions }
  end

  context 'moderator accessing a published post' do
    let(:post) { FactoryGirl.create(:post, user: author) }

    it 'includes post in resolved scope' do
      expect(resolved_scope).to include(post)
    end

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'moderator accessing an unpublished post' do
    let(:post) { FactoryGirl.create(:post, user: author, disactive: true) }

    it 'excludes user from resolved scope' do
      expect(resolved_scope).not_to include(post)
    end

    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_action(:destroy) }
  end

end