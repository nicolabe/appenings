@feed

Feature: Manage appenings

  Background:
    Given the following users:
    | id | username | email           | password |
    |  1 | Nico     | nico@mail.com   | 12341234 |
    |  2 | Ingrid   | ingrid@mail.com | 12341234 |
    And Ingrid is friends with Nico
    And Nico is friends with Ingrid

  @javascript
  Scenario: List feed
    Given Ingrid has posted a new appening "Bungee jump"
    And I am signed out
    And I am logged in as Nico
    When I follow Feed
    Then I should see "Bungee jump"
