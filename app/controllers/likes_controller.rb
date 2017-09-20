class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Bookmark liked!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "There was an error liking the bookmark. Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "You have unliked #{@bookmark.url}."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "There was an error unliking #{@bookmark.url}. Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end
end
