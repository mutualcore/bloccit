class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def update?
    user.admin? or not post.published?
  end

  def index?
    if user.guest?
      false
    else
      true
    end
  end
end