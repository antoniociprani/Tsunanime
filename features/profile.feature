Feature: profile

    As a registered user
    I want to access my profile
    so that I can modify my personal information


Scenario: profile
    Given I am authenticated
    Given I am on the home page
    Then I should see button "profile"
    Then I should click on the button "profile"
    Then I should see "h1" "Your Profile"
    And I should see "a" "Edit"
 