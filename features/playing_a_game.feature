Feature: Playing a game
  In order to play battleships
  As a human being
  I want to interact with the board

  Scenario: Seeing the board
    Given I am on the game page
    Then I should see "ABCDEFGHIJ"

  Scenario: Placing a ship
    Given I am on the game page
    When I select "Battleship" from "ship_type"
    When I select "Horizontal" from "direction"
    When I fill in "location" with "A1"
    When I press "submit"
    Then I should see "BBBB"

  Scenario: Entering gameplay, firing
    Given I am on the game page
    When I select "Battleship" from "ship_type"
    When I select "Horizontal" from "direction"
    When I fill in "location" with "A1"
    When I press "submit"
    Then I should see "Game in Action"
    When I fill in "fire_loc" with "A1"
    When I press "Shoot!"
    Then I should see "hit"
