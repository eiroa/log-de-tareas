Feature: Create task
  In order to monitor the users's work
  As a teacher
  I want to be able to create a task

  Background:
    Given there are not task
    Given there is at least one group
    And I am logged in

	@wip
  Scenario: Happy path
    Given I am on "create task page"
    And I fill in "task[name]" with "Tarea1"
    And I fill in "task[description]" with "Descripcion de la tarea"
    When I press "saveButton"
    Then I should see "The task Tarea1 has been created"

	@wip
  Scenario: Name is blank
    Given I am on "create task page"
    And I fill in "task[name]" with " "
    And I fill in "task[description]" with "Descripcion de la tarea"
    When I press "saveButton"
    Then I should see "Error"

	@wip
  Scenario: Description is blank
    Given I am on "create task page"
    And I fill in "task[name]" with "Tarea1"
    And I fill in "task[description]" with " "
    When I press "saveButton"
    Then I should see "Error"

	@wip
  Scenario: Name is a symbol
    Given I am on "create task page"
    And I fill in "task[name]" with "&"
    And I fill in "task[description]" with "Descripcion de la tarea"
    When I press "saveButton"
    Then I should see "Error"

	@wip
  Scenario: Task id already exists
    Given I am on "create task page"
    And event with named "Tarea1" already exists
    And I fill in "task[name]" with "Tarea1"
    And I fill in "task[description]" with "Descripcion de la tarea"
    When I press "saveButton"
    Then I should see "Tarea1 already exists"


