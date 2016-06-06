require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    # save_and_open_page
    expect(page).to have_content('Sign Up')
  end

  feature "signing up a user" do
    let(:user) { FactoryGirl.build(:user) }
    before { signup(user) }

    it "shows username on the homepage after signup" do
      save_and_open_page
      expect(page).to have_content(user.username)
    end

  end

end

feature "logging in" do
  let(:user) { FactoryGirl.create(:user) }
  before { login(user) }

  it "shows username on the homepage after login" do
    # save_and_open_page
    expect(page).to have_content(user.username)
  end

end

feature "logging out" do

  it "begins with logged out state"

  it "doesn't show username on the homepage after logout"

end
