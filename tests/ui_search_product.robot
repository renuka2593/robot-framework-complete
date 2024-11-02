*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://automationexercise.com

*** Test Cases ***
Open Browser And Verify Title
    [Documentation]    Open a browser and verify the page title on automationexercise
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Title Should Be    Automation Exercise
    Close Browser

Navigate to Product Page and Search T-shirt
    [Documentation]    Navigate to Product page and Search T-shirt
    Open Browser    ${URL}/products    chrome
    Maximize Browser Window
    Close Browser