class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
    authorize @bookmark
  end

  def create
    @user = current_user
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
    @bookmark.user = @user
    @bookmark.topic = @topic
    @bookmark.name = params[:bookmark][:name]
    @bookmark.url = params[:bookmark][:url]

    if @bookmark.save
      flash[:notice] = "Your bookmark was successfully saved."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving your bookmark. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark
    @bookmark.name = params[:bookmark][:name]
    @bookmark.url = params[:bookmark][:url]

    if @bookmark.save
      flash[:notice] = "Your bookmark was successfully updated."
      redirect_to @bookmark.topic
    else
      flash[:alert] = "There was an error updating your bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "#{@bookmark.name} was successfully deleted."
      redirect_to @bookmark.topic
    else
      flash[:alert] = "There was an error deleting #{@bookmark.name}. Please try again."
      redirect_to @bookmark
    end
  end
end
