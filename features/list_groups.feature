Feature: List groups
  In order to manage the groups
  As a teacher
  I want to be able to list the groups

  Background:
    Given there are not groups
    And I am logged in


  Scenario: I have one group named "Grupo1"
    Given there is group with name "Grupo1"
    Given I am on "the index group page"
    Then I should see "Grupo1"


  Scenario: I have two groups with names "Grupo1" and "Grupo2"
    Given there is group with name "Grupo1"
    Given there is group with name "Grupo2"
    Given I am on "the index group page"
		Then I should see "Grupo1"
    Then I should see "Grupo2"
    

  Scenario: I don't have groups
    Given I am on "the index group page"
	Then I shoud see "No tienes grupos creados"


  Scenario: Button to view pending tasks are present
	Given I am on "the index group page"
    When I press "viewPendingTasksButton"
    Then I should see "Tareas pendientes"
	
