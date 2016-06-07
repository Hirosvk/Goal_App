require "shoulda-matchers"

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  def login(user)
    visit new_session_url
    fill_in("Username", with: user.username )
    fill_in("Password", with: user.password )
    click_on("Log in")
  end

  def signup(user)
    visit new_user_url
    fill_in("Username", with: user.username )
    fill_in("Password", with: user.password )
    click_on("Sign Up")
  end

  def logout
    visit users_url
    click_on("Log out")
  end

  def add_goal_for(user, title)
    visit new_user_goal_url(user)
    fill_in "Title", with: title
    choose "Private"
    fill_in "Completion", with: 20
    click_on "Add Goal"
  end


end
