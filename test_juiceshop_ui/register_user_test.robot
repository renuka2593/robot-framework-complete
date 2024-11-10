*** Settings ***
Library    Browser
Library    FakerLibrary

*** Variables ***
${DISMISS_BANNER}       .close-dialog
${ACCOUNT_LINK}         css=#navbarAccount
${LOGIN_LINK}           button#navbarLoginButton
${NEW_CUSTOMER_LINK}    css=#newCustomerLink a.primary-link
${EMAIL}                emailControl
${PASSWORD}             passwordControl
${REPEAT_PASSWORD}      repeatPasswordControl
${COOKIE_BTN}           text=Me want it!
${SECURITY_ANSWER}      id=securityAnswerControl
${REGISTER_BTN}         id=registerButton

*** Test Cases ***
Register with New User - Happy Path
    Open Browser And Navigate
    Click And Wait For Page load    ${DISMISS_BANNER}
    Click And Wait For Page load    ${COOKIE_BTN}
    Click And Wait For Page load    ${ACCOUNT_LINK}
    Click And Wait For Page load    ${LOGIN_LINK}
    Click And Wait For Page load    ${new_customer_link}
    ${EMAIL_INPUT}=     Get Element    id=${EMAIL}
    ${EMAIL_ID}=    FakerLibrary.Email
    LOG        ${EMAIL_ID}
    fill text    ${EMAIL_INPUT}     ${EMAIL_ID}
    ${PASSWORD_INPUT}=     Get Element    id=${PASSWORD}
    fill text    ${PASSWORD_INPUT}    abcd#12344
    ${REPEAT_PASSWORD_INPUT}=     Get Element    id=${REPEAT_PASSWORD}
    fill text    ${REPEAT_PASSWORD_INPUT}    abcd#12344
    ${SECURITY_QUESTION_DRP}=       get element by role    combobox
    Click And Wait For Page load    ${SECURITY_QUESTION_DRP}
    ${SPAN_TEXT}=  get element    span.mat-option-text:has-text('maiden name')
    Click And Wait For Page load    ${SPAN_TEXT}
    fill text    ${SECURITY_ANSWER}    pw
    Click And Wait For Page load    ${REGISTER_BTN}
    Wait For Condition    Title    should start with    OWASP Juice Shop

*** Keywords ***
Open Browser And Navigate
    [Arguments]     ${HEADLESS}=true
    NEW BROWSER    chromium     headless=${HEADLESS}
    new context
    new page    http://localhost:3000/

Click And Wait For Page load
    [Arguments]    ${LOCATOR}
    scroll to element           ${LOCATOR}
    click                       ${LOCATOR}
    wait for load state           timeout=30