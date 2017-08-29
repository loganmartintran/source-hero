require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:user) { User.create!(username: 'user', email: 'user@user.com', password: 'password') }
  let(:topic) { user.topics.create!(title: 'title', user: user) }
  let(:bookmark) { topic.bookmarks.create!(url: 'bookmark@bookmark.com', topic: topic) }

  describe "attributes" do
    it "should have a url and topic attribute" do
      expect(bookmark).to have_attributes(url: 'bookmark@bookmark.com', topic: topic)
    end

    it "should belong to a topic" do
      expect(bookmark).to belong_to(:topic)
    end
  end
end
