*** Settings ***
Library  SeleniumLibrary



*** Variables ***

${URL}            https://www.saucedemo.com/
${BROWSER}        Chrome
${DRIVER}         C:/Users/Compe/Documents/chromedriver_win32/chromedriver.exe
${DELAY}          0

*** Test Cases ***
Test Checkout
    Prepare Browser

    Login      standard_user      secret_sauce

    Add to Cart     Backpack

    Wait Until Page Contains Element   xpath://*[@id="shopping_cart_container"]/a

    Click Element    xpath://*[@id="shopping_cart_container"]/a

    Click Element    xpath://*[@id="checkout"]

    Your Information  Jaska  Jokunen  33500

    Click Element   xpath://*[@id="finish"]

    Click Button  xpath://*[@id="back-to-products"]

    Logout

    Close Browser

*** Keywords ***

Prepare Browser
    Open Browser    ${URL}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
Login
    [Arguments]     ${user}     ${password}
    Input Text      id=user-name    ${user}
    Input Text      id=password     ${password}
    Click Button    xpath://*[@id="login-button"]
Add To Cart
    [Arguments]     ${item}
    Click Button    xpath://*[@id="add-to-cart-sauce-labs-backpack"]
Your Information
    [Arguments]     ${first_name}     ${last_name}     ${zip_code}
    Input Text      id=first-name   ${first_name}
    Input Text      id=last-name    ${last_name}
    Input Text      id=postal-code  ${zip_code}
    Click Element   xpath://*[@id="continue"]
Logout
    Click Button  xpath://*[@id="react-burger-menu-btn"]
    Sleep  1s
    Click Link  xpath://*[@id="logout_sidebar_link"]

