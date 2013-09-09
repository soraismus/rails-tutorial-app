require 'spec_helper'

describe "Authentication" do

  subject { page }
  before { visit signin_path }

  describe "sign-in page" do
    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "signing in" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      fill_in "Email", with: user.email.upcase
    end

    describe "with invalid information" do
      before do
        fill_in "Password", with: "invalid"
        click_button "Sign in"
      end

      it { should have_title("Sign in") }
      it { should have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      before do
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.name) }
      it { should have_link("Profile", href: user_path(user)) }
      it { should have_link("Sign out", href: signout_path) }
      it { should_not have_link("Sign in", href: signin_path) }
    end
  end

end
