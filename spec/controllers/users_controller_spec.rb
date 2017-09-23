require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create!(username: 'user', email: 'user@user.com', password: 'password') }

  describe "GET #show" do
    it "returns http success" do
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
  end

end
