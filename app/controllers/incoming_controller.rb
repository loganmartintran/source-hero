class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params}"

     # You put the message-splitting and business
     # magic here.
     # Find the user by using params[:sender]
     @user = params[:sender]
     # Find the topic by using params[:subject]
     @topic = params[:subject]
     # Assign the url to a variable after retreiving it from params["body-plain"]
     @url = params["body-plain"]
     # Check if user is nil, if so, create and save a new user
     if User.find_by(email: @user).nil?
       User.create!(email: @user, password: 'password')
     end
     # Check if the topic is nil, if so, create and save a new topic
     if Topic.find_by(title: @topic).nil?
       Topic.create!(title: @topic, user: @user)
     end
     # Now that you're sure you have a valid user and topic, build and save a new bookmark
     Bookmark.create!(topic: @topic, url: @url)
     # Assuming all went well.

    head 200
  end
end
