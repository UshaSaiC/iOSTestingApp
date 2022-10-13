Feature: Button View
As a user, I should be able to tap on Button, enter first name and last name and get it displayed on UI

Scenario: Navigate to button view, fill in details and verify name being displayed

Given App is Ready
When I Click on Button
And I Enter First Name
And I Enter Last Name
And I Click on Get Name Button
And Close Keypad
Then I Should See Name being Displayed

Scenario: Navigate to button view and verify when get name button is clicked no name being displayed on UI

Given App is Ready
When I Click on Button
And I Click on Get Name Button
Then I Should Not See Name being Displayed

