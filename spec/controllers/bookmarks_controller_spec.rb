require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:user) { User.create!(username:'user', email:'user@user.com', password:'password') }
  let(:topic) { user.topics.create!(title:'title') }
  let(:bookmark) { topic.bookmarks.create!(url:'bookmark@url.com', name:'bookmark') }

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(response).to render_template :show
    end

    it "assigns bookmark to @bookmark" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(assigns(:bookmark)).to eq bookmark
    end
  end

  describe "GET #new" do
    before do
      sign_in user
    end

    it "returns http success" do
      get :new, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: topic.id
      expect(response).to render_template :new
    end

    it "instantiates a @bookmark" do
      get :new, topic_id: topic.id
      expect(assigns(:bookmark)).not_to be_nil
    end
  end

  describe "POST #create" do
    before do
      sign_in user
    end

    it "assigns a new bookmark to a @bookmark" do
      post :create, topic_id: topic.id, bookmark: {name:'name', url:'url@url.com'}
      expect(assigns(:bookmark)).to eq Bookmark.last
    end

    it "increases the number of bookmarks by 1" do
      expect { post :create, topic_id: topic.id, bookmark: {name:'name', url:'url@url.com'}}.to change(Bookmark,:count).by(1)
    end

    it "redirects to the new bookmark" do
      post :create, topic_id: topic.id, bookmark: {name:'name', url:'url@url.com'}
      expect(response).to redirect_to [topic, Bookmark.last]
    end
  end

  describe "GET #edit" do
    before do
      sign_in user
    end

    it "returns http success" do
      get :edit, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: topic.id, id: bookmark.id
      expect(response).to render_template :edit
    end

    it "assigns bookmark to be updated to @bookmark" do
      get :edit, topic_id: topic.id, id: bookmark.id
      expect(assigns(:bookmark)).to eq bookmark
    end
  end

  describe "PUT #update" do
    before do
      sign_in user
    end

    it "updates the bookmark with expected attributes" do
      new_name = 'new name'
      new_url = 'newurl@url.com'

      put :update, topic_id: topic.id, id: bookmark.id, bookmark: {name: new_name, url: new_url}

      updated_bookmark = assigns(:bookmark)

      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.name).to eq new_name
      expect(updated_bookmark.url).to eq new_url
    end

    it "redirects to the topic index" do
      new_name = 'new name'
      new_url = 'newurl@url.com'

      put :update, topic_id: topic.id, id: bookmark.id, bookmark: {name: new_name, url: new_url}

      updated_bookmark = assigns(:bookmark)

      expect(response).to redirect_to topic
    end
  end

  describe "DELETE #destroy" do
    before do
      sign_in user
    end

    it "deletes the bookmark" do
      bookmark
      expect {delete :destroy, topic_id: topic.id, id: bookmark.id}.to change{Bookmark.all.count}.by(-1)
    end

    it "redirects to the topic view" do
      delete :destroy, topic_id: topic.id, id: bookmark.id
      expect(response).to redirect_to topic
    end
  end

end
