class TopicPolicy < ApplicationPolicy
  attr_reader :user, :topic

  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def index?
    @user
  end

  def show?
    @user
  end

  def create?
    @user
  end

  def new?
    @user
  end

  def update?
    @user && (@topic.user == @user)
  end

  def edit?
    @user && (@topic.user == @user)
  end

  def destroy?
    @user && (@topic.user == @user)
  end

  class Scope < Scope
    def resolve
      scope.where(user: @user)
    end
  end
end
