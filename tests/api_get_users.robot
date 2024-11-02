*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://reqres.in

*** Test Cases ***
Get User Information
    [Documentation]    Test to retrieve user information from an API and validate response.
    ${response}=    GET    ${BASE_URL}/api/users/2
    Status Should Be    ${response}    200
    Log    Response Status: ${response.status_code}
    Dictionary Should Contain Key    ${response.json()}  data
    ${json_data}=    Convert To Dictionary    ${response.json()}
    Log    Response Body: ${json_data}
    ${email}=    Get From Dictionary    ${json_data["data"]}    email
    Should Be Equal    ${email}    janet.weaver@reqres.in

*** Keywords ***
Status Should Be
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Numbers    ${response.status_code}    ${expected_status}
