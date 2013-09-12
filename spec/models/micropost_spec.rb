require 'spec_helper'

describe Micropost do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) do
    # The following code is not idiomatically correct:
    # @micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
    # The following code is idiomatically correct:
    user.microposts.build(content: "Lorem ipsum")
  end

  subject { @micropost }

  it { should respond_to :content }
  it { should respond_to :user_id }
end
