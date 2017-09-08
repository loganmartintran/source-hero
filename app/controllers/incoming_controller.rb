class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     # Find the user
     @incoming_sender = params[:sender]

     # Find the topic
     @incoming_topic = params[:subject]

     # Assign the url to a variable
     incoming_url = params["body-plain"]

     # This code is to only create a new bookmark if a user already exists
     if User.find_by(email: @incoming_sender) != nil
       user = User.find_by(email: @incoming_sender)
       topic = Topic.where(title: @incoming_topic, user: user).first_or_create
       Bookmark.create!(topic: topic, url: incoming_url)
     end

     # This code below will check to see if a user is not existent first, and if not it will create a new user.

    #  if User.find_by(email: @incoming_sender).nil?
    #    user = User.create!(email: @incoming_sender, password: 'password')
    #  else
    #    user = User.find_by(email: @incoming_sender)
    #  end
     #
    #  if Topic.find_by(title: @incoming_topic).nil?
    #    topic = Topic.create!(user: user, title: @incoming_topic)
    #  else
    #    topic = Topic.find_by(title: @incoming_topic)
    #  end
     #
    #  Bookmark.create!(topic: topic, url: incoming_url)

     # Assuming all went well.
     head 200

  end
end
