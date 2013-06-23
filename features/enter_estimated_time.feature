@wip
Feature: Enter estimated time
  In order to estimate a task
  As a student
  I want to be able enter the estimated time for a task

  Background:
    Given I am logged in
    And I have assigned the task with name "Task1" for the group "Grupo1"
    And I am on "the index group page"
    And I press "Grupo1"
    And I press "Tarea1"


  Scenario: Happy path    
    And I fill in "est_time" with "10"
    When I press "submit"
    Then I should see "La estimadacion ha sido ingresada correctamente"
	
  Scenario: Input a string in estimated time and see a error
	  And I fill in "est_time" with "diez"
	  When I press "submit"
	  Then I should see "El tiempo estimado debe ser un numero"
	
	Scenario: Input a negative time -10 in estimated time and see a error
	  And I fill in "est_time" with "-10"
	  When I press "submit"
	  Then I should see "El tiempo estimado debe ser un numero positivo"
	
	Scenario: estimated time is blank and see a error
    And I fill in "est_time" with " "
    When I press "submit"
    Then I should see "El tiempo estimado no puede ser vacio"

