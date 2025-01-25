*** Settings ***
Library           RPA.Windows
Library    ../venv/lib/python3.13/site-packages/robot/libraries/OperatingSystem.py

*** Test Cases *** 
Run Notepad
    Windows Run    notepad.exe  
    Click          name:'Untitled - Notepad'