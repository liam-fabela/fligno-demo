*** Settings ***
Documentation     A resource file with reusable keywords and variables.

Library    SeleniumLibrary
Library    FakerLibrary



*** Variables ***
${browser}    chrome
${url}    https://opensource-demo.orangehrmlive.com/index.php/dashboard
${username}    Admin
${password}    admin123
${newUser}    Tzuyu
${wePass}    12345678
${bePass}    hrn*790@
${strPass}   9Tn#0Q2@0Hapq
${sample}    2
${edPass}    4yfP$bD9cDh2*Vu


*** Keywords ***


The user is in the users page of the web application
    open browser    ${url}    ${browser}
    maximize browser window
    input text    id:txtUsername     ${username}
    input text    id:txtPassword    ${password}
    click element    xpath://input[@id='btnLogin']
    mouse over    id:menu_admin_viewAdminModule
    mouse over    id:menu_admin_UserManagement
    mouse over    id:menu_admin_viewSystemUsers
    click link    xpath://a[@id='menu_admin_viewSystemUsers']

User clicks the add button
     click element    xpath://input[@id='btnAdd']

User fills out the input fields
     select from list by index    id:systemUser_userType     0
     input text    id:systemUser_employeeName_empName    n
     click element    xpath://body/div[4]/ul[1]/li[5]
     input text    id:systemUser_userName    ${newUser}
     select from list by index    id:systemUser_status    0
     input text    id:systemUser_password    ${strPass}
     log to console    FakerLibrary.Password
     input text    id:systemUser_confirmPassword     ${strPass}

User clicks the save button
     click element    class:addbutton


A "${message}" message appears
     wait until element is visible    //*[@id="frmList_ohrmListComponent"]/div[2]
     ${response}     get text    xpath://*[@id="frmList_ohrmListComponent"]/div[2]
     should be equal as strings    ${response}    ${message}

User fills all search input fields
     input text    id:searchSystemUser_userName  ${newUser}
     select from list by index    id:searchSystemUser_userType    1
     input text    id:searchSystemUser_employeeName_empName    n
     click element    xpath://body/div[4]/ul[1]/li[5]
     select from list by index    id:searchSystemUser_status     1

User clicks the search button
     click element    id:searchBtn

Table should display the correct result
      table cell should contain    xpath://*[@id="resultTable"]    2     2    ${newUser}

User clicks the username in the data table
     click link    xpath://*[@id="resultTable"]/tbody/tr/td[2]/a

User clicks the edit button
     click element    id:btnSave

User edits all the input fields
     select from list by index    id:systemUser_userType     0
     clear element text    xpath://*[@id="systemUser_employeeName_empName"]
     input text    id:systemUser_employeeName_empName    t
     click element    xpath://body/div[4]/ul[1]/li[5]
     input text    id:systemUser_userName    Twice
     select from list by index    id:systemUser_status    0
     select checkbox     id:systemUser_chkChangePassword
     input text    id:systemUser_password    ${edPass}
     input text    id:systemUser_confirmPassword     ${edPass}

User submits the updated data
     click element    xpath://*[@id="btnSave"]

User ticks the checkbox beside a username
     select checkbox     xpath://input[@id='ohrmList_chkSelectRecord_8']

User clicks the delete button
     click element     id:btnDelete

User confirms the deletion
     click element    xpath://input[@id='dialogDeleteBtn']


User ticks 2 checkboxes in the table
     select checkbox    xpath://input[@id='ohrmList_chkSelectRecord_19']
     select checkbox    xpath://input[@id='ohrmList_chkSelectRecord_14']



