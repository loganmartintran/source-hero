require 'rails_helper'

describe TopicPolicy do

  context 'being a visitor' do
    subject { described_class.new(user, topic) }
    let(:topic) { Topic.create }
    let(:user) { nil }

    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:new) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context "being a user and doing crud on other users' data"  do
    subject { described_class.new(user, topic) }

    let(:user) {
      User.create!(
      username: 'signed in user',
      email: 'user@user.com',
      password: 'password'
      ) }

    let(:topic) { Topic.create }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to forbid_action(:show) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:edit) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context "being a user and doing crud on their own data" do
    subject { described_class.new(my_user, my_topic) }

    let(:my_user) {
      User.create!(
      username: 'signed in user',
      email: 'user@user.com',
      password: 'password'
      )
    }

    let(:my_topic) {
      my_user.topics.create!(
      title: 'my topic'
      )
    }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:create) }
    it { is_expected.to permit_action(:new) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:edit) }
    it { is_expected.to permit_action(:destroy) }
  end

end
