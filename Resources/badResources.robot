*** Settings ***
Documentation     A resource file with reusable keywords and variables.

Library    SeleniumLibrary


*** Variables ***
${browser}    chrome
${url}    https://opensource-demo.orangehrmlive.com/index.php/dashboard
${username}    Admin
${password}    admin123
${newUser}    Testing
${wePass}    12345678
${bePass}    hrn*790@
${strPass}   9Tn#fhrit78
${sample}    2
${edPass}    4yfP$bD9cDh2*Vu
${EMPTY}
${special}    z#$@^&*(
${special2}    456#$670


*** Keywords ***
User is on the add page of the web application
     reload page


User did not fill out one required input field
     select from list by index    id:systemUser_userType     0
     input text    id:systemUser_employeeName_empName    n
     click element    xpath://body/div[4]/ul[1]/li[5]
     input text    id:systemUser_userName    ${EMPTY}
     select from list by index    id:systemUser_status    0
     input text    id:systemUser_password    ${strPass}
     log to console    FakerLibrary.Password
     input text    id:systemUser_confirmPassword     ${strPass}

A required text appears below the empty field
     element text should be    //*[@id="frmSystemUser"]/fieldset/ol/li[3]/span    Required


User did not fill out all required input fields
     input text    id:systemUser_employeeName_empName    ${EMPTY}
     input text    id:systemUser_userName    ${EMPTY}
     input text    id:systemUser_password    ${EMPTY}
     input text    id:systemUser_confirmPassword     ${EMPTY}

required texts would appear below empty fields
     element text should be    //*[@id="frmSystemUser"]/fieldset/ol/li[2]/span    Required
     element text should be    //*[@id="frmSystemUser"]/fieldset/ol/li[3]/span    Required
     element text should be    //*[@id="frmSystemUser"]/fieldset/ol/li[6]/span    Required
     sleep    10s

User enters data with special characters to the username field
     select from list by index    id:systemUser_userType     0
     input text    id:systemUser_employeeName_empName    n
     click element    xpath://body/div[4]/ul[1]/li[4]
     input text    id:systemUser_userName    ${special}
     select from list by index    id:systemUser_status    0
     input text    id:systemUser_password    ${strPass}
     input text    id:systemUser_confirmPassword     ${strPass}

Invalid username would appear below the field
     element text should be    //*[@id="frmSystemUser"]/fieldset/ol/li[3]/span    Invalid Username

User enters number and special characters to the employee and username fields
     select from list by index    id:systemUser_userType     0
     input text    id:systemUser_employeeName_empName    ${special2}
     input text    id:systemUser_userName    ${special2}
     select from list by index    id:systemUser_status    0

Update fails
     page should not contain element    xpath://*[@id="frmList_ohrmListComponent"]/div[2]



