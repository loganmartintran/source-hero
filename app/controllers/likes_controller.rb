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

  end
end
