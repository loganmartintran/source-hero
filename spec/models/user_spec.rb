require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(username: 'user', email: 'user@user.com', password: 'password') }

  describe "attributes" do
    it "should have username, email, and password attributes" do
      expect(user).to have_attributes(username: 'user', email: 'user@user.com', password: 'password')
    end

    it "should respond to username" do
      expect(user).to respond_to(:username)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
  end

end
