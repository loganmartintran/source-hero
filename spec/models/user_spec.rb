require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(username: 'user', email: 'user@user.com', password: 'password') }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_length_of(:username).is_at_least(3) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(8) }

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
