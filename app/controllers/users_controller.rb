class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks
    @user_likes = @user.likes
  end
end
