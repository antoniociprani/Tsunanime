Feature: anime_reviews

    As a registered User
    I want to have an homepage
    so that I can see the latest anime reviews

    As a registered user
    I want to have an homepage 
    so that I can see the latest anime releases

Scenario: latest anime releases
    Given I am authenticated
    Given Anime "Testanime" with description "testdescription" and author "testauthor" and id "5"
    Given I am on the home page
    Then I should see "h2" "Latest Releases"
    And I should see "h4" "Testanime"

Scenario: lates anime reviews
    Given I am authenticated
    Given Anime "Testanime" with description "testdescription" and author "testauthor" and id "5"
    Given Review "Testreview" by user "43" for anime "5" with score "5"
    Given I am on the home page
    Then I should see "h2" "Latest Reviews"
    And I should see "p" "Testreview"

    