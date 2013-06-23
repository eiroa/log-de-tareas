@wip
Feature: List pending tasks
  In order to view the pending task of a group
  As a student

  Background:
    Given I am logged in
    And there are not tasks
    And there are not groups
    And there is group with name "Grupo1"
    And there is task with name "Tarea1" for the group "Grupo1"
    And I am assign a task with name "Tarea1" of the group "Grupo1"
    

  Scenario: Happy path - first task
  	Given I an on "the pending tasks page"
  	Then I should see "Tarea1 - Grupo1"
  	
  
  Scenario: Happy path - second task
    Given there is task with name "Tarea2" for the group "Grupo1"
    And I an on "the pending tasks page"
  	Then I should see "Tarea1 - Grupo1"  	
    Then I should see "Tarea2 - Grupo1"
    

  Scenario: Estimation and time tracked pending    
    Given I an on "the pending tasks page"
    Then I should see "estimationButton"
    

  Scenario: Estimation done and time tracked pending    
    Given I an on "the pending tasks page"
    Then I should see "trackTimeButton"  