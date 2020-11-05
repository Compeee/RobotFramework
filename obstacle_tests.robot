*** Settings ***
Resource            resource.robot

Suite Setup         Prepare Browser
#Suite Teardown      Close Browser 

Test Setup          Open Obstacle
Test Teardown       Verify Solved

*** Test Cases ***

TWINS
    [Tags]  12952
    Wait Until Page Contains Element    xpath=(//a[@id="id"])[2]
    Click Element                       xpath=(//a[@id="id"])[2]
    Verify Solved

Can you do this one?
     [Tags]  22505
     Wait Until Page Contains Element    xpath=(//a[@id="dontuseid"])[2]
     Click Element                       xpath=(//a[@id="dontuseid"])[2]

WaitAMoment
    [Tags]  33678

    Click Element   id=one
    Wait Until Element Is Enabled   id=two  2 minutes
    Click Element   id=two
