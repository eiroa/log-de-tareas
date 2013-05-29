Feature: List task
  In order to manage the task of a group
  As a teacher
  I want to be able to list a tasks of the group

  Background:
    Given there are not task
    Given there is group with name "Grupo1"
    Given there is task with name "Tarea1"
    Given there is task with name "Tarea2"
    And I am logged in

  Scenario: Easy way - first task
    Given I am on "view groups"
    When I press "groups[grupo1][view]"
    Then I should see "Tarea1"

  Scenario: Easy way - second task
    Given I am on "view groups"
    When I press "groups[grupo1][view]"
    Then I should see "Tarea2"
    
