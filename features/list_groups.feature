Feature: List task
  In order to manage the task of a group
  As a teacher
  I want to be able to list a tasks of the group

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


