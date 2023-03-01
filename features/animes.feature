Feature: animes

    As a registered user
    I want to have an anime list page
    so that I can see all the animes of the website
Scenario: top5
    Given I am authenticated
    Given Anime "Testanime" with description "testdescription" and author "testauthor" and id "5"
    Given Anime "Testanime2" with description "testdescription2" and author "testauthor2" and id "8"
    Given I am on the home page
    Then I click link "Anime"
    Then I should see "h1" "Animes"
    And I should see "h5" "Testanime"
    And I should see "h5" "Testanime2"