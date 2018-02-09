class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.published
    end
  end
  
  def index?
    true
  end

  def create?
    user && user.creator?
  end

  def destroy?
    user && user.moderator?
  end

  def update?
    user && user.moderator?
  end
end
