require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { User.create!(username:'user', email:'user@user.com', password:'password') }
  let(:topic) { user.topics.create!(title:'title') }
  let(:bookmark) { topic.bookmarks.create!(url:'url@url.com') }
  let(:like) { Like.create!(user: user, bookmark: bookmark) }

  describe "POST #create" do
    before do
      sign_in user
      request.env["HTTP_REFERER"] = "http://expertsexchange.com" #required for request back to not error for test on line 15
    end

    it "increases the like count by 1" do
      expect { post :create, topic_id: topic.id, bookmark_id: bookmark.id, like: {user_id: user.id, bookmark_id: bookmark.id }}.to change(Like,:count).by(1)
    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in user
      request.env["HTTP_REFERER"] = "http://test.host/topics/1/bookmarks/1"
    end

    it "deletes the like" do
      like = user.likes.where(bookmark: bookmark.id).create
      expect(like).not_to be_nil
      expect { delete :destroy, topic_id: topic.id, bookmark_id: bookmark.id, id: like.id}.to change{Like.all.count}.by(-1)
    end

    it "redirects to the bookmark" do
      delete :destroy, {topic_id: topic.id, bookmark_id: bookmark.id, id: like.id}
      expect(response).to redirect_to [bookmark.topic, bookmark]
    end
  end

end
