*** Settings ***
Resource    ../resources/page_manager.robot
Resource    ../resources/ui_common.robot
Test Setup   Open Headless Browser   ${base_url}    chrome
Test Teardown      End Web Test

*** Variables ***
${base_url}     https://automationexercise.com
${product_page}     https://automationexercise.com/products

*** Test Cases ***
Open Browser And Verify Title
    Verify Page Title    Automation Exercise

Navigate to Product Page and Search T-shirt
    Navigate To   ${product_page}
    Search Product    tshirt
    Verify Product Is Displayed
