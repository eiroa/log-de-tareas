Feature: List groups
  In order to manage the groups
  As a teacher
  I want to be able to list the groups

  Background:
    Given there are not task
    Given there is group with name "Grupo1"
    Given there is group with name "Grupo2"
    And I am logged in

  Scenario: Easy way - first item
    Given I am on "view groups"
    Then I should see "Grupo1"

  Scenario: Easy way second item
    Given I am on "view groups"
    Then I should see "Grupo2"


