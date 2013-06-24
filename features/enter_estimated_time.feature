
Feature: Enter estimated time
  In order to estimate a task
  As a student
  I want to be able enter the estimated time for a task

  Background:
    Given I am logged in
    And there are not tasks
    And there are not groups
    And there is group with name "Grupo1"
    And I have assigned the task with name "Task1" of the group "Grupo1"
    And I am on "the index group page"
    And I follow "viewPendingTasksButton"
    And I press "estimation_Task1_button"


  Scenario: Happy path    
    And I fill in "minutes" with "10"
    When I press "submit"
    Then I should see "La estimacion ha sido ingresada correctamente"
 
 @wip
  Scenario: Input a string in estimated time and see a error
	  And I fill in "minutes" with "diez"
	  When I press "submit"
	  Then I should see "El tiempo ingresado debe ser un numero entero positivo"
	
	Scenario: Input a negative time -10 in estimated time and see a error
	  And I fill in "minutes" with "-10"
	  When I press "submit"
	  Then I should see "El tiempo ingresado no puede ser negativo"
	
	Scenario: estimated time is blank and see a error
    And I fill in "minutes" with ""
    When I press "submit"
    Then I should see "El tiempo ingresado no puede ser vacio"


