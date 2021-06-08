*** Settings ***
Documentation     A test suite containing test related to invalid  CRUD.



Resource         ../Resources/badResources.robot
Resource         ../Resources/resource.robot


*** Test Cases ***
Create Data- one empty field is submitted
     Given the user is in the users page of the web application
     When user clicks the add button
     And user did not fill out one required input field
     And user clicks the save button
     Then a required text appears below the empty field

Create Data- all empty fields are submitted
     Given user is on the add page of the web application
     When user did not fill out all required input fields
     And user clicks the save button
     Then required texts would appear below empty fields

Create Data- user enters special characters in username and submit it
     Given user is on the add page of the web application
     When user enters data with special characters to the username field
     And user clicks the save button
     Then invalid username would appear below the field

Update Data- user enters numbers and special characters to employee and username fields
     Given user clicks the username in the data table
     When user clicks the edit button
     And user enters number and special characters to the employee and username fields
     And user submits the updated data
     Then update fails
