
*** Settings ***

Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Resource    ${EXEC_DIR}\\resources\\bases\\base.robot
Library     ${EXECDIR}\\resources\\libraries\\nova.py

*** Variables ***
${CHANGE_USERS_IMAGE_DIR}          ${EXECDIR}\\resources\\elements\\MudarUsuario

*** Keywords ***

Add Change Users Image Path
    Add Base Image Path
    Add Image Path      ${CHANGE_USERS_IMAGE_DIR}

Click on Login
    Click               NomeUsuario.PNG

Fill in the data
    Input Text          NomeUsuario.PNG     Test
    Press Special Key   TAB
    Input Text          ${EMPTY}            123456
    Press Special Key   ENTER

