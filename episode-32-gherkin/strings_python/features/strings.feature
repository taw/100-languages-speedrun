Feature: String Functions
  Scenario: ASCII name
      Given name is "Lech"
       Then its length is 4
        And its uppercase is "LECH"
        And its lowercase is "lech"

  Scenario: Unicode name
      Given name is "Wałęsa"
       Then its length is 6
        And its uppercase is "WAŁĘSA"
        And its lowercase is "wałęsa"

  Scenario: Empty string
      Given name is ""
       Then its length is 0
        And its uppercase is ""
        And its lowercase is ""
