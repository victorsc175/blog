class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.moderator?
  end

  def create?
    user.moderator?
  end

  def destroy?
    user.moderator?
  end

  def update?
    user.moderator?
  end
end
