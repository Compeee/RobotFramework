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
    Click Button  css=[data-qa=signup-button]
    Element Should Be Visible  xpath://b[contains(text(), 'Enter Account Information')]
    Click Element  xpath://*[@id="id_gender1"]
    Input Text  css=[data-qa=password]  salasana
    Select From List By Value  xpath://*[@id="days"]  29
    Select From List By Value  xpath://*[@id="months"]  1
    Select From List By Value  xpath://*[@id="years"]  1999
    Input Text  css=[data-qa=first_name]  Eero
    Input Text  css=[data-qa=last_name]  Jormala
    Input Text  css=[data-qa=company]  Nokia
    Input Text  css=[data-qa=address]  Sammonkatu 48
    Select From List By Value  xpath://*[@id="country"]  United States
    Input Text  css=[data-qa=state]  California
    Input Text  css=[data-qa=city]  San Francisco
    Input Text  css=[data-qa=zipcode]  33540
    Input Text  css=[data-qa=mobile_number]  123456890
    Click Button  css=[data-qa=create-account]
    Element Should Be Visible  xpath://b[contains(text(), 'Account Created')]
    Click Element  css=[data-qa=continue-button]
    Wait Until Page Contains Element  xpath://a[contains(text(), 'Delete Account')]
    Click Link    xpath://a[contains(text(), 'Delete Account')]
    Element Should Be Visible  xpath://b[contains(text(), 'Account Deleted!')]
*** Keywords ***

Prepare Browser
    Open Browser    ${URL}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

