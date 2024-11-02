*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://reqres.in

*** Keywords ***
Send GET Request
    [Arguments]    ${endpoint}
    ${response}=    GET    ${BASE_URL}${endpoint}
    RETURN    ${response}

Parse JSON
    [Arguments]    ${response}
    ${json_data}=    Convert To Dictionary    ${response.json()}
    RETURN    ${json_data}

Status Should Be
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Numbers    ${response.status_code}    ${expected_status}


Get JSON Key
    [Arguments]    ${json_data}    ${key}
    ${value}=   Get From Dictionary   ${json_data["data"]}    ${key}
    RETURN    ${value}
