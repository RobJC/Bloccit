class PostPolicy < ApplicationPolicy
  
  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(user_id: user)
      end
    end
  end
  
  def index?
    true
  end
  
  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
  
end