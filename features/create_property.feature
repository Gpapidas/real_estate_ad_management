Feature: User logs in, creates a property, and sees it in their properties page
  As a registered user
  I want to log in, go to the property creation page, fill the form and submit it,
  and then have my newly created property appear in the properties page

  Scenario: User logs in, creates a property, and sees it in their properties page
    Given I am on the login page
    When I log in with valid credentials
    Then I navigate to the create form page
    And I should see the form page
    And I fill out the create form with valid data
    And I submit the form
    Then I navigate to my properties page
    And I should see the newly created property