*** Settings ***
Library           SeleniumLibrary   run_on_failure=Nothing

*** Variables ***
${URL}            https://www.saucedemo.com/
${BROWSER}        Chrome
${DRIVER}         rf-env/WebDriverManager/chrome/86.0.4240.22/chromedriver_win32/chromedriver.exe
${DELAY}          0



*** Test Cases ***
Test Checkout
    Prepare Browser
    Login      standard_user      secret_sauce

    Add to Cart     Backpack

    Wait Until Page Contains Element    xpath=//*[@id="shopping_cart_container"]/a
    Click Button    xpath=//*[@id="shopping_cart_container"]/a

    Click Button    CHECKOUT
    #Close Browser 



*** Keywords ***

Prepare Browser
    Open Browser    ${URL}    ${BROWSER}   executable_path=${DRIVER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Login
    [Arguments]     ${user}     ${password}
    Input Text      id=user-name    ${user}    
    Input Text      id=password     ${password}  
    Click Button    LOGIN
Add To Cart
    [Arguments]     ${item} 
    Click Button    XPATH=//div[@class='inventory_item' and contains(.,'${item}')]//button[contains(.,'ADD')]
