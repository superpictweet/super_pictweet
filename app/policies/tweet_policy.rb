class TweetPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    record.user_id == user.id || user.admin?
  end


  def destroy?
    record.user_id == user.id || user.admin?
  end
end
