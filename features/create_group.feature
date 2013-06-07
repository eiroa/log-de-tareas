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
    Then I should see "The group Grupo1 has been created"

  @wip
  Scenario: Name is blank
    Given I am on "the create group page"
    And I fill in "group_name" with " "
    When I press "submit"
    Then I should see "Error"

  @wip
  Scenario: Name is a symbol
    Given I am on "create group page"
    And I fill in "group_name" with "&"
    When I press "submit"
    Then I should see "Error"

  @wip
  Scenario: Group id already exists
    Given I am on "create group page"
    And event with named "Grupo1" already exists
    And I fill in "event[name]" with "Grupo1"
    When I press "submit"
    Then I should see "Grupo1 already exists"


