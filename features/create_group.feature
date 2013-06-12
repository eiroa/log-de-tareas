Feature: Create group
  In order to group another users
  As a teacher
  I want to be able to create a group

  Background:
    Given there are not groups
    And I am logged in


  Scenario: Happy path
    Given I am on "the create group page"
    And I fill in "group_name" with "Grupo1"
    When I press "submit"
    Then I should see "El grupo Grupo1 ha sido creado exitosamente"
    

  Scenario: Name is blank
    Given I am on "the create group page"
    And I fill in "group_name" with " "
    When I press "submit"
    Then I should see "El nombre del grupo no deberia ser vacio o contener simbolos"
    

  Scenario: Name is a symbol
    Given I am on "the create group page"
    And I fill in "group_name" with "&"
    When I press "submit"
    Then I should see "El nombre del grupo no deberia ser vacio o contener simbolos"
    

  Scenario: Group name already exists
    Given I am on "the create group page"
    Given there is group with name "Grupo1"
    And I fill in "group_name" with "Grupo1"
    When I press "submit"
    Then I should see "El grupo Grupo1 ya existe"


