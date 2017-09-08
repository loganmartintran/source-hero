class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     # Find the user
     @incoming_sender = params[:sender]

     # Find the topic
     @incoming_topic = params[:subject]

     # Assign the url to a variable
     incoming_url = params["body-plain"]

     # Check if user is nil, if so, create and save a new user
     if User.find_by(email: @incoming_sender).nil?
       user = User.create!(email: @incoming_sender, password: 'password')
     else
       user = User.find_by(email: @incoming_sender)
     end

     # Check if the topic is nil, if so, create and save a new topic
     if Topic.find_by(title: @incoming_topic).nil?
       topic = Topic.create!(user: user, title: @incoming_topic)
     else
       topic = Topic.find_by(title: @incoming_topic)
     end

     # Now that you're sure you have a valid user and topic, build and save a new bookmark
     Bookmark.create!(topic: topic, url: incoming_url)

     # Assuming all went well.
     head 200
  end
end
