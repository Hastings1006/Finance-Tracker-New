class AccountPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
        scope.where(user: user)
    end
  end
end
