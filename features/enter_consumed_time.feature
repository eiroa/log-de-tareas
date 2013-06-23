@wip
Feature: Enter consumed time
  In order to estimate a task
  As a student
  I want to be able enter the estimated time for a task

  Background:
    Given I am logged in
    And I have assigned the task with name "Task1" and time estimated for the group "Grupo1"
    And I am on "the index group page"
    And I press "Grupo1"
    And I press "Tarea1"


  Scenario: Happy path    
    And I fill in "cons_time" with "10"
    When I press "submit"
    Then I should see "El tiempo consumido ha sido ingresado correctamente"
	
  Scenario: Input a string in consumed time and see a error
	  And I fill in "cons_time" with "diez"
	  When I press "submit"
	  Then I should see "El tiempo consumido debe ser un numero"
	
	Scenario: Input a negative time -10 in consumed time and see a error
	  And I fill in "cons_time" with "-10"
	  When I press "submit"
	  Then I should see "El tiempo consumido debe ser un numero positivo"
	
	Scenario: consumed time is blank and see a error
    And I fill in "cons_time" with " "
    When I press "submit"
    Then I should see "El tiempo consumido no puede ser vacio"
    
    