class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params}"

     # You put the message-splitting and business
     # magic here.
     # Find the user by using params[:sender]
     @incoming_sender = params[:sender]
     # Find the topic by using params[:subject]
     @incoming_topic = params[:subject]
     # Assign the url to a variable after retreiving it from params["body-plain"]
     @incoming_url = params["body-plain"]
     # Check if user is nil, if so, create and save a new user
     if User.find_by(email: @incoming_sender).nil?
       user = User.create!(email: @incoming_sender, password: 'password')
     else
       user = @incoming_sender
     end
     # Check if the topic is nil, if so, create and save a new topic
     @topic = user.topics.find_or_create_by(title: @incoming_topic)
     # Now that you're sure you have a valid user and topic, build and save a new bookmark
     Bookmark.create!(topic: @topic, url: @incoming_url)
     # Assuming all went well.
     puts "Last bookmark created: #{Bookmark.last}"
    head 200
  end
end
