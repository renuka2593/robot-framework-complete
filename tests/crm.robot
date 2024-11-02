*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://google.com

*** Test Cases ***
Open Browser And Verify Title
    [Documentation]    Open a browser and verify the page title on Example.com
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Title Should Be    Google
    Close Browser
