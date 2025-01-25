*** Settings ***
Library           FlaUILibrary

*** Variables ***
${TEST_TEXT}      This is a test of FlaUI with Robot Framework.

*** Test Cases ***

Open Notepad and Write Text
    [Documentation]  This test opens Notepad, writes text, and verifies the content.
    ${APPLICATION_PID}    Launch Application    notepad.exe
    Attach Application By Pid    ${APPLICATION_PID}
    Wait Until Element Exist       /Window[@Name='Untitled - Notepad']
    Move To    /Window[@Name='Untitled - Notepad']
    Click    /Window[@Name='Untitled - Notepad']
    Take Screenshot