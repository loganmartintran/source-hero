class BookmarkPolicy < ApplicationPolicy
  attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
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
    @user && (@bookmark.user == @user)
  end

  def edit?
    @user && (@bookmark.user == @user)
  end

  def destroy?
    @user && (@bookmark.user == @user)
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end
