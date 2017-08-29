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
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
