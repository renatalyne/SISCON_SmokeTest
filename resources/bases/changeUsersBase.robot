
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

And clicked on "Trocar Usuário" Login
    Click               MudarUsuarioWindow.png


When the data is filled 
    [Arguments]         ${Login}            ${Password}
    Input Text          NomeUsuario.PNG     ${Login} 
    Press Special Key   TAB
    Input Text          ${EMPTY}            ${Password}
    Press Special Key   ENTER

Then an expected error should appeared
    Wait Until Screen Contain   Error1SenhaExpirada.PNG     ${TEMPO}


Then the change user windows should appeared
    Wait Until Screen Contain   MudarUsuarioWindow.png      ${TEMPO}

# Expected Sucess
#     Wait Until Screen Contain   Sucess.PNG     ${TEMPO}
#     Click                       Sucess.PNG

Then an sucessfull message should appeared 
    Wait Until Screen Contain   MudarUsuarioSucesso.PNG     ${TEMPO}
    Click                       MudarUsuarioSucesso.PNG     150     70