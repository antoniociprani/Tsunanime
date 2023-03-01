Feature: top5

    as a registered user 
    I want to have a top 5 page
    so that I can see the 5 best animes
Scenario: top5
    Given I am authenticated
    Given Anime "Testanime" with description "testdescription" and author "testauthor" and id "5"
    Given Review "Testreview" by user "43" for anime "5" with score "5"
    Given I am on the home page
    Then I click link "Top 5"
    Then I should see "h1" "Top5 Animes"
    And I should see "h5" "Testanime"