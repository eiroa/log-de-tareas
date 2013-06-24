@wip
Feature: Enter consumed time
  In order to estimate a task
  As a student
  I want to be able enter the estimated time for a task

  Background:
    Given I am logged in
    And there are not tasks
    And there are not groups
    And there is group with name "Grupo1"
    And I have assigned the task with name "Task1" of the group "Grupo1"
    Given I have already assigned a time estimation to "Task1"
    And I am on "the index group page"
    And I follow "viewPendingTasksButton"
    And I press "track_Task1_button"


  Scenario: Happy path    
    And I fill in "minutes" with "10"
    When I press "submit"
    Then I should see "El tiempo consumido ha sido ingresado correctamente"
@wip	
  Scenario: Input a string in consumed time and see a error
	  And I fill in "minutes" with "diez"
	  When I press "submit"
	  Then I should see "El tiempo ingresado debe ser un numero"
	
	Scenario: Input a negative time -10 in consumed time and see a error
	  And I fill in "minutes" with "-10"
	  When I press "submit"
	  Then I should see "El tiempo ingresado no puede ser negativo"
	
	Scenario: consumed time is blank and see a error
    And I fill in "minutes" with ""
    When I press "submit"
    Then I should see "El tiempo ingresado no puede ser vacio"
    
    