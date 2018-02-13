# User policy
class UserPolicy < ApplicationPolicy
  # User scope
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user && user.moderator?
  end

  def show?
    user && user.moderator?
  end

  def create?
    user && user.moderator?
  end

  def destroy?
    user && user.moderator?
  end

  def update?
    user && user.moderator?
  end
end
