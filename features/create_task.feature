Feature: Create task
  In order to monitor the users's work
  As a teacher
  I want to be able to create a task

  Background:
    Given there are not task
    And there are not groups
    And I am logged in
    And there is group with name "Grupo1"


  Scenario: Happy path
    Given I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with "test1"
    And I fill in "task_description" with "test_description"
    When I press "submit"
    Then I should see "The task test1 has been created"


  Scenario: Name is blank
    Given I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with " "
    And I fill in "task_description" with "test_description"
    When I press "submit"
    Then I should see "The task name don't should be empty or content symbols"


  Scenario: Description is blank
   Given I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with "test2"
    And I fill in "task_description" with " "
    When I press "submit"
    Then I should see "The task description don't should be empty or content symbols"


  Scenario: Name is a symbol
    Given I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with " "
    And I fill in "task_description" with "test_description"
    When I press "submit"
    Then I should see "The task name don't should be empty or content symbols"


  Scenario: Task id already exists
    Given there is task with name "Test1" for the group "Grupo1"
    And I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with "Test1"
    And I fill in "task_description" with "test_description"
    When I press "submit"
    Then I should see "The task Test1 already exist"


