*** Settings ***
Library           RPA.Windows

*** Tasks *** 
Set Text Into Notepad Window
    Windows Run    Notepad
    Control Window      subname:Notepad
    ${element} =    Get Element    regex:"Text (E|e)ditor"
    Set Value    ${element}    note to myself
    Click    name:File