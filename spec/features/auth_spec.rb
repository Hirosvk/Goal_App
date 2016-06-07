require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    # save_and_open_page
    expect(page).to have_content('Sign Up')
  end

  feature "signing up a user" do
    let(:user) { FactoryGirl.build(:user) }
    before { signup(user) }

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content(user.username)
    end
  end
end

feature "logging in" do
  let(:user) { FactoryGirl.create(:user) }
  before { login(user) }

  scenario "shows username on the homepage after login" do
    # save_and_open_page
    expect(page).to have_content(user.username)
  end
end

feature "logging out" do
  let(:user) { FactoryGirl.create(:user) }
  before do
    login(user)
    logout
  end

  scenario "begins with logged out state" do
    visit users_url
    expect(page).to have_content('Log in')
  end


  scenario "doesn't show username on the homepage after logout" do
    visit users_url
    expect(page).not_to have_content(user.username)
  end

end
