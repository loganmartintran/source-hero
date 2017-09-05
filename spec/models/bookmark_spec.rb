require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:user) { User.create!(username: 'user', email: 'user@user.com', password: 'password') }
  let(:topic) { user.topics.create!(title: 'title', user: user) }
  let(:bookmark) { topic.bookmarks.create!(url: 'bookmark@bookmark.com', topic: topic, name: 'bookmark') }

  describe "attributes" do
    it "should have a url, topic, and name attribute" do
      expect(bookmark).to have_attributes(url: 'bookmark@bookmark.com', topic: topic, name: 'bookmark')
    end

    it "should belong to a topic" do
      expect(bookmark).to belong_to(:topic)
    end

    it "responds to url attribute" do
      expect(bookmark).to respond_to(:url)
    end

    it "responds to topic attribute" do
      expect(bookmark).to respond_to(:topic)
    end

    it "responds to name attribute" do
      expect(bookmark).to respond_to(:name)
    end
  end
end
