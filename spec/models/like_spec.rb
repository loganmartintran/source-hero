require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create!(username:'user', email:'user@user.com', password:'password') }
  let(:topic) { Topic.create!(user: user, title: 'title') }
  let(:bookmark) { Bookmark.create!(topic: topic, url: 'bookmark.com') }
  let(:like) { Like.create!(user: user, bookmark: bookmark) }

  describe "attributes" do
    it "has user and bookmark attributes" do
      expect(like).to have_attributes(user: user, bookmark: bookmark)
    end

    it "responds to user" do
      expect(like).to respond_to(:user)
    end

    it "responds to bookmark" do
      expect(like).to respond_to(:bookmark)
    end
  end
end
