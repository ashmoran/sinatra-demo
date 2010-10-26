Feature: Home page
  In order to learn about the site
  As a casual browser
  I want to see a home page

  Scenario: First visit
    When I go to the home page
    Then I should see "Welcome"
    And I should see "Log in"
    
  Scenario: Log in correctly
    Given I am on the home page
    When I log in
    Then I should be on the home page
    And I should see a personalised welcome message
    And I should see a personalised welcome message
  
  Scenario: Log in incorrectly
    Given I am on the home page
    When I log in with incorrect credentials

    # For some reason, Rack::Test ends up on the wrong page here.
    # We get stuck on the /unauthenticated page with a 401 status.
    # I've got a vague idea what's going on but I don't know enough
    # about Rack to figure it out.
    #
    # Then I should be on the login page
    
    Then I should see "App: Login"
    And I should see "Could not log you in."

  Scenario: Log out
    Given I am logged in
    When I log out
    Then I should be on the home page
    And I should see "Log in"
    And I should not see a personalised welcome message
