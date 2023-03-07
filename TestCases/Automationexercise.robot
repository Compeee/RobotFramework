*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL}            https://automationexercise.com/
${BROWSER}        Chrome
${DRIVER}         C:/Users/Compe/Documents/chromedriver_win32/chromedriver.exe
${DELAY}          0

*** Test Cases ***
Test Register User
    Prepare Browser
    Element Should Be Visible  xpath://*[@id="slider-carousel"]/div
    Click Link    xpath://a[contains(text(), 'Signup / Login')]
    Element Should Be Visible  xpath://h2[contains(text(), 'New User Signup!')]
    Input Text  css=[data-qa=signup-name]  Jaska Jokunen
    Input Text  css=[data-qa=signup-email]  jaska.jokunen@outlook.com
*** Keywords ***

Prepare Browser
    Open Browser    ${URL}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

