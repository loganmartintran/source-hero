class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Your topic has been saved successfully."
      redirect_to @topic
    else
      flash[:alert] = "There was a problem saving your topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Your topic was updated sucessfully."
      redirect_to @topic
    else
      flash[:alert] = "There was a problem updating your topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "#{@topic.title} was successfully deleted."
      redirect_to topics_path
    else
      flash[:alert] = "There was a problem deleting #{@topic.title}. Please try again."
      redirect_to @topic
    end
  end

end
