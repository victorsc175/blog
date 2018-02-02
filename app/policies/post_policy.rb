class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.creator?
  end

  def destroy?
    user.moderator?
  end

  def update?
    user.moderator?
  end
end