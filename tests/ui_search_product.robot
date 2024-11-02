*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem  # Needed to use sys in the Evaluate statement

*** Variables ***
${URL}     https://automationexercise.com

*** Test Cases ***
Open Browser And Verify Title
    [Documentation]    Open a browser in headless mode and verify the page title on automationexercise
    Open Headless Browser    ${URL}    chrome
    Maximize Browser Window
    Title Should Be    Automation Exercise
    Close Browser

Navigate to Product Page and Search T-shirt
    [Tags]    search    ui    product
    [Documentation]    Navigate to Product page and Search T-shirt
    Open Headless Browser    ${URL}/products    chrome
    Maximize Browser Window
    Click Element    //a[@href='/products']
    Input Text    id=search_product    tshirt
    Click Element    id=submit_search
    page should contain element    //div[@class='productinfo text-center']/p
    scroll element into view       //div[@class='productinfo text-center']/p
    Close Browser

*** Keywords ***
Open Headless Browser
    [Arguments]    ${url}    ${browser}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser    ${url}    ${browser}    options=${options}
