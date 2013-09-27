require 'spec_helper'

describe Channel do
  let(:user) { FactoryGirl.create(:user) }
  let(:channel) do
    user.channels.build(name: "channel_name", open: true)
  end

  subject { channel }

  it { should be_valid }

  it { should respond_to :name }
  it { should respond_to :open }
  it { should respont_to :user_id }
  it { should respond_to :user }
end
