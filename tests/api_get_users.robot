*** Settings ***
Resource    ../resources/api_resource.robot

*** Test Cases ***
Get User Information
    [Documentation]    Test to retrieve user information from an API and validate response.
    ${response}=    Send GET Request    /api/users/2
    Status Should Be    ${response}    200
    ${json_data}=    Parse JSON    ${response}
    Dictionary Should Contain Key    ${json_data}    data
    ${email}=    Get JSON Key    ${json_data}    email
    Should Be Equal    ${email}    janet.weaver@reqres.in
