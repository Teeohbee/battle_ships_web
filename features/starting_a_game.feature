Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Entering Website
    Given I am on the homepage
    When I press "New Game"
    Then I should see "What's your name?"

  Scenario: Filling in player name
    Given I am on the newgame page
    When I fill in "playername" with "Toby"
    And I press "submit"
    Then I should see "Game start"
    And I should see "Toby"

  Scenario: Player does not enter name
    Given I am on the newgame page
    When I fill in "playername" with ""
    When I press "submit"
    Then I should see "What's your name?"