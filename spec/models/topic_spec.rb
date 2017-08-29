require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:user) { User.create!(username: "user", email: "user@user.com", password: "password") }
  let(:topic) { user.topics.create!(title: "title") }

  describe "attributes" do
    it "should have title attribute" do
      expect(topic).to have_attributes(title: topic.title, user: topic.user)
    end

    it "should belong to a user" do
      expect(topic).to belong_to(:user)
    end
  end
end
