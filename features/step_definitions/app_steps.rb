module LoginHelpers
  def log_in(options)
    When "I go to the home page"
    click_link "Log in"
    fill_in "E-mail:", with: options[:as]
    fill_in "Password:", with: options[:with_password]
    click_button "Log in"
  end
end
World(LoginHelpers)


# Authentication

When /^I log in$/ do
  log_in as: "a@b.com", with_password: "password"
end

When /^I log in with incorrect credentials$/ do
  log_in as: "a@b.com", with_password: "wrongpassword"
end

Given /^I am logged in$/ do
  log_in as: "a@b.com", with_password: "password"
end

When /^I log out$/ do
  click_link "Log out"
end


# App content

Then /^I should see a personalised welcome message$/ do
  Then 'I should see "Welcome a@b.com"'
end

Then /^I should not see a personalised welcome message$/ do
  Then 'I should not see "Welcome a@b.com"'
end
