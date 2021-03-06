require 'spec_helper'

create_users = lambda do |num|
  num.times do |i|
    input = {}
    input[:name] = "user#{i}"
    input[:email] = "a#{i}@example.com"
    input[:password] = "password"
    input[:password_confirmation] = "password"
    User.create(input)
  end
end

destroy_users = lambda do |num|
  num.times do |i|
    User.find_by_name("user#{i}").destroy
  end
end

describe Channel do
  let(:user) { FactoryGirl.create(:user) }
  let(:channel) do
    user.channels.build(name: "channel_name", open: true)
  end

  subject { channel }

  it { should be_valid }

  it { should respond_to :name }
  it { should respond_to :open }
  it { should respond_to :user_id }
  it { should respond_to :user }

  describe "when 10 users are created and then deleted" do
    specify "10 channels should be created concurrently" do
      expect { create_users.call(10) }.to change(Channel, :count).by(10)
    end
  end

  describe "when 10 users are deleted" do
    before { create_users.call(10) }
    specify "at least 10 channels should be destroyed concurrently" do
      expect { destroy_users.call(10) }.to change(Channel, :count).by(-10)
    end
  end

end
