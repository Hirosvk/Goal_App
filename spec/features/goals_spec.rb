require 'spec_helper'
require 'rails_helper'

feature "goal creation" do
  subject(:user) { FactoryGirl.create(:user) }
  before(:each) { login(user) }

  scenario "has a New Goal link on user's profile" do
    visit user_url(user)
    expect(page).to have_content("New Goal")
  end

  scenario "renders new again if goal parameters invalid" do
    visit new_user_goal_url(user)
    fill_in "Title", with: "goal title"
    click_on "Add Goal"
    expect(page).to have_content("Add Goal")
    expect(page).to have_content("Status can't be blank")
  end

  before { title = "run 2 miles every day" }

  scenario "after goal creation, redirects to user's profile" do
    add_goal_for(user, title)
    expect(page).to have_content("#{user.username}'s Goals!")

  end

  scenario "created goals show up on user's profile" do
    add_goal_for(user, title)
    expect(page).to have_content(title)
  end
end

feature "reading goals" do
  subject(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:goal) { FactoryGirl.create(:private_goal, user: user1) }
  # before(:each){ goal = FactoryGirl.create(:private_goal, user: user1) }

  scenario "user can see all of their own goals" do
    login(user1)
    visit user_url(user1)
    save_and_open_page
    expect(page).to have_content(goal.title)
  end

  scenario "user cannot see other user's private goals" do
    login(user2)
    visit user_url(user1)
    expect(page).not_to have_content(goal.title)
  end
end

feature "updating goals" do
  scenario "has an edit link for each goal"

  scenario "user cannot edit other user's goals"

  scenario "changes show up on user's profile"
end

feature "deleting goals" do
  scenario "has a delete button for each goal when logged in"

  scenario "user cannot delete other users' goals"

  scenario "deleted goals do not show up on user's profile"
end
