Feature: List task
  In order to manage the task of a group
  As a teacher
  I want to be able to list a tasks of the group

  Background:
    And I am logged in
    Given there are not task
    Given there are not groups
    Given there is group with name "Grupo1"
    

  Scenario: Happy path - first task
    Given there is task with name "Tarea1" for the group "Grupo1"
    Given there is task with name "Tarea2" for the group "Grupo1"
    Given I am on "the index group page"
    When I press "Grupo1"
    Then I should see "Tarea1"


  Scenario: Happy path - second task
    Given there is task with name "Tarea1" for the group "Grupo1"
    Given there is task with name "Tarea2" for the group "Grupo1"
    Given I am on "the index group page"
    When I press "Grupo1"
    Then I should see "Tarea2"
    

  Scenario: Happy path - second task    
    Given I am on "the index group page"
    When I press "Grupo1"
    Then I should see "No hay tareas para el grupo Grupo1"
