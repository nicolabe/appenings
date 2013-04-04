@appenings

Feature: Manage appenings

  Background:
    Given the following users:
    | id | username | email           | password |
    |  1 | Nico     | nico@mail.com   | 12341234 |
    |  2 | Ingrid   | ingrid@mail.com | 12341234 |

  Scenario: Sign-in
    Given I am on the login page
    When I follow Log in
    And I fill in "Email" with "nico@mail.com"
    And I fill in "Password" with "12341234"
    And I press "Sign in"
    Then I should see "Signed in successfully." 
    And I should be on the list of appenings

  Scenario: List appenings
    Given I have appenings called "I want to climb a mountain", "I want to go bungee jumping"
    And I am logged in as Nico
    Then I should see "I want to climb a mountain"
    And I should have 2 appenings

  @javascript
  Scenario: Create a new appening
    Given I have no appenings
    And I am logged in as Nico
    When I follow new
    And I fill in "new_appening_field" with "My cool appening"
    And I submit the form
    And I wait 1 seconds
    Then I should see "My cool appening"
    And I should have 1 appenings
    #And I should see "Appening successfully created."

  Scenario: Accomplish appening
    Given I have appenings called "I want to climb a mountain"
    And I am logged in as Nico
    When I follow accomplish_appening
    Then I should see "Congratulations, you've accomplished a goal!"
    And I should have 1 accomplished appenings

  @javascript
  Scenario: Remove appening
    Given I have appenings called "I want to climb a mountain"
    And I am logged in as Nico
    When I follow delete_appening
    And I confirm the dialog box
    Then I should have 0 appenings
    And I should see "Appenings"
