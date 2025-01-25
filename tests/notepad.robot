*** Settings ***
Library           FlaUILibrary

*** Variables ***
${NOTEPAD_PATH}   C:\\Windows\\System32\\notepad.exe
${TEST_TEXT}      This is a test of FlaUI with Robot Framework.

*** Test Cases ***

Open Notepad and Write Text
    [Documentation]  This test opens Notepad, writes text, and verifies the content.
    Launch Application    ${NOTEPAD_PATH}
    Wait For Window       Name:Untitled - Notepad    Timeout:5s
    Move
    Input Text            AutomationId:15           ${TEST_TEXT}    # Text area AutomationId
    Sleep                 2s
    Verify Text Written   ${TEST_TEXT}
    Close Notepad
