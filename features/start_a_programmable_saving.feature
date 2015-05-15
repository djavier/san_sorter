Feature: Start a Programamble Saving
  In order to save money while having fun
  As a person in neeed
  I want to start a Programmable Saving

Scenario: 1 savers

Scenario: 3 savers
  Given I want to start a programmable saving with a pool of 3000
  Given that a saver named "oliver" exists
  Given that a saver named "josue" exists
  Given that a saver named "dariel" exists
  When "oliver" joins to the programmable saving with 1 ticket
  And "dariel" joins to the programmable saving with 2 ticket
  And "josue" joins to the programmable saving with 1 ticket
  And the programmable saving starts on the next payday
  Then the tickets should state that:
    | Order | Name   | Paydate       |
    | 1     | Josue  | May 15, 2015  |
    | 2     | Dariel | May 30, 2015  |
    | 3     | Oliver | June 15, 2015 |
    | 4     | Dariel | June 30, 2015 |

Scenario: 7 savers