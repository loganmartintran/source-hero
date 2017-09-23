class LikesController < ApplicationController
  def index
    @likes = Like.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like

    if @like.save
      flash[:notice] = "#{@bookmark.url} liked!"
      redirect_to :back
    else
      flash[:alert] = "There was an error liking the bookmark. Please try again."
      redirect_to :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])
    authorize @like

    if @like.destroy
      flash[:notice] = "You have unliked #{@bookmark.url}."
      redirect_to :back
    else
      flash[:alert] = "There was an error unliking #{@bookmark.url}. Please try again."
      redirect_to :back
    end
  end
end
