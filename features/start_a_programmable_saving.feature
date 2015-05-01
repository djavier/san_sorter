Feature: Start a Programamble Saving
  In order to save money while having fun
  As a person in neeed
  I want to start a Programmable Saving

Scenario: 1 savers

Scenario: 2 saver
  Given I want to start a programmable saving
  Given that a saver named "oliver" exists
  And that a saver named "josue" exists
  When I add "oliver" to the programmable saving with "1" ticket
  And I add "josue" to the programmable saving with "1" ticket
  And the programmable saving starts on the next payday
  And the programmable saving pool amount is 3000
  Then the programmable saving should state that:
    | Order | Name   | Paydate       |
    | 1     | Josue  | May. 15, 2015 |
    | 2     | Oliver | May. 30, 2015 |

Scenario: 7 savers