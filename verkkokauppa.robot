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

    Wait Until Page Contains Element   xpath=//*[@id="shopping_cart_container"]/a

    Click Element    xpath=//*[@id="shopping_cart_container"]/a
   
    Click Element    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]

    Your Information  Jaska  Jokunen  33500

    Click Element   xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
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
Your Information
    [Arguments]     ${first_name}     ${last_name}     ${zip_code}     
    Input Text      id=first-name   ${first_name}
    Input Text      id=last-name    ${last_name}
    Input Text      id=postal-code  ${zip_code}

    Click Element   xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input