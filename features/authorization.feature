Feature: authorization

    As an admin
    I want to have a tools page
    so that I can upgrade a user to moderator

    As a moderator
    I want to have a tools page
    so that I can add a new anime to the website



Scenario: admin login
    Given User test
    Given I am authenticated as a admin
    Given I am on the home page
    Then I should see button "tools" 
    Then I should click on the button "tools"
    Then I should see "h1" "Tools"
    Then I should see user test upgrade
    Then I should click update for test1
    Then I should see M tag on test1

Scenario: moderator add anime
    Given I am authenticated as a moderator
    Given I am on the home page
    Then I should see button "tools" 
    Then I should click on the button "tools"
    Then I should see "h1" "Tools"
    Then I add anime title "testanime" description "testdescription" author "testauthor"
    Then I should see "h1" "testanime"