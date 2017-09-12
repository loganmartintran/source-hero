class TopicPolicy < ApplicationPolicy
  def index?
    @user
  end

  def show?
    @user && (record.user == @user)
  end

  def create?
    @user
  end

  def new?
    @user
  end

  def update?
    @user && (record.user == @user)
  end

  def edit?
    @user && (record.user == @user)
  end

  def destroy?
    @user && (record.user == @user)
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end
