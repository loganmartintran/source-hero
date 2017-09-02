require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:user) { User.create!(username: 'user', email: 'user@user.com', password: 'password') }
  let(:topic) { user.topics.create!(title:'topic', user: user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: topic.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: topic.id}
      expect(response).to render_template :show
    end

    it "assigns topic to @topic" do
      get :show, {id: topic.id}
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates a new @topic" do
      get :new
      expect(assigns(:topic)).not_to be(nil)
    end
  end

  describe "POST #create" do
    it "increases the number of topics by 1" do
      expect{ post :create, topic: {title: 'title'} }.to change(Topic,:count).by(1)
    end

    it "assigns Topic.last to @topic" do
      post :create, topic: { title: 'title' }
      expect(assigns(:topic)).to eq Topic.last
    end

    it "redirects to the new topic" do
      post :create, topic: { title: 'title' }
      expect(response).to redirect_to Topic.last
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: topic.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: topic.id}
      expect(response).to render_template :edit
    end

    it "assigns topic to be edited to @topic" do
      get :edit, {id: topic.id}
      topic_instance = assigns(:topic)
      expect(topic_instance.id).to eq topic.id
      expect(topic_instance.title).to eq topic.title
      expect(topic_instance.user).to eq topic.user
    end
  end

  describe "PUT #update" do
    it "updates the topic with the correct attribute" do
      new_title = "New Title"

      put :update, id: topic.id, topic: { title: new_title, user: user }

      updated_topic = assigns(:topic)
      expect(updated_topic.id).to eq topic.id
      expect(updated_topic.title).to eq new_title
    end

    it "redirects to the updated topic" do
      new_title = "New Title"

      put :update, id: topic.id, topic: { title: new_title, user: user }

      expect(response).to redirect_to topic
    end
  end

  describe "DELETE #destroy" do
    it "decreases the number of topics by 1" do
      delete :destroy, {id: topic.id}
      count = Topic.where({id: topic.id}).count
      expect(count).to eq 0
    end

    it "redirects to the #index view" do
      delete :destroy, {id: topic.id}
      expect(response).to redirect_to topics_path
    end
  end

end
