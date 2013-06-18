Feature: Create task
  In order to monitor the users's work
  As a teacher
  I want to be able to create a task

  Background:
    Given there are not tasks
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
    Then I should see "La tarea test1 ha sido creada correctamente"


  Scenario: Name is blank
    Given I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with " "
    And I fill in "task_description" with "test_description"
    When I press "submit"
    Then I should see "El nombre de la tarea no deberia ser vacio o contener simbolos"


  Scenario: Description is blank
   Given I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with "test2"
    And I fill in "task_description" with " "
    When I press "submit"
    Then I should see "La descripcion de la tarea no deberia ser vacio o contener simbolos"


  Scenario: Name is a symbol
    Given I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with " "
    And I fill in "task_description" with "test_description"
    When I press "submit"
    Then I should see "El nombre de la tarea no deberia ser vacio o contener simbolos"


  Scenario: Task id already exists
    Given there is task with name "Test1" for the group "Grupo1"
    And I am on "the index group page"
    And I press "Grupo1"
    And I press "create_task"    
    And I fill in "task_name" with "Test1"
    And I fill in "task_description" with "test_description"
    When I press "submit"
    Then I should see "La tarea Test1 ya existe"


