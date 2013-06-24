@wip
Feature: List pending tasks
  In order to view the pending task of a group
  As a student

  Background:
    Given I am logged in
    And there are not tasks
    And there are not groups
    And there is group with name "Grupo1"
    And I have assigned the task with name "Tarea1" of the group "Grupo1"
    

  Scenario: Happy path - first task
    Given I am on "the index group page"
  	And I follow "viewPendingTasksButton"
  	Then I should see "Tarea1 - Grupo1"
  	
  
  Scenario: Happy path - second task
    Given I have assigned the task with name "Tarea2" of the group "Grupo1"
    And I am on "the index group page"
    And I follow "viewPendingTasksButton"
  	Then I should see "Tarea1 - Grupo1"  	
    Then I should see "Tarea2 - Grupo1"
    

  Scenario: Estimation and time tracked pending    
    Given I am on "the pending task page"
    And I press "estimation_Tarea1_button"
    Then I should see "Estimar la tarea Tarea1"
    

  Scenario: Estimation done and time tracked pending  
    Given I have already assigned a time estimation to "Tarea1" 
    And I am on "the pending task page"   
    And I press "track_Tarea1_button"
    Then I should see "Trackear la tarea Tarea1"  
    