*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Headless Browser
    [Arguments]      ${url}    ${browser}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Set Headless Options    ${options}
    Open Browser    ${url}   ${browser}    options=${options}

Set Headless Options
    [Arguments]    ${options}
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage

End Web Test
    Close Browser

Verify Page Title
    [Arguments]    ${expected_title}
    Title Should Be    ${expected_title}

Navigate To
     [Arguments]    ${url}
     go to    ${url}