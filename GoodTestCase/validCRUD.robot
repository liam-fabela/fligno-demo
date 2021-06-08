*** Settings ***
Documentation     A test suite containing test related to valid  CRUD.



Resource         ../Resources/resource.robot


*** Test Cases ***
Create data
     Given the user is in the users page of the web application
     When user clicks the add button
     And user fills out the input fields
     And user clicks the save button
     Then a "Successfully Saved" message appears


Read/Search data
     Given user fills all search input fields
     When user clicks the search button
     Then table should display the correct result

Update Data
     Given user clicks the username in the data table
     When user clicks the edit button
     And user edits all the input fields
     And user submits the updated data
     Then a "Successfully Updated" message appears

Delete 1 Data
     Given user ticks the checkbox beside a username
     When user clicks the delete button
     And user confirms the deletion
     Then a "Successfully Deleted" message appears

Delete 2 Data
     Given user ticks 2 checkboxes in the table
     When user clicks the delete button
     And user confirms the deletion
     Then a "Successfully Deleted" message appears





