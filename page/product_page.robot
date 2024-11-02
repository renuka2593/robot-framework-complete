*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SEARCH_PRODUCT_FIELD}    id=search_product
${SEARCH_BUTTON}           id=submit_search
${PRODUCT_INFO}            //div[@class='productinfo text-center']/p

*** Keywords ***
Search Product
    [Arguments]    ${product_name}
    Input Text    ${SEARCH_PRODUCT_FIELD}    ${product_name}
    Click Element    ${SEARCH_BUTTON}

Verify Product Is Displayed
    Element Should Be Visible    ${PRODUCT_INFO}
    Scroll Element Into View    ${PRODUCT_INFO}
