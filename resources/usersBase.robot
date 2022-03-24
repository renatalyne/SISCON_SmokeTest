*** Settings ***
#TODO: Organizar nome dos testes.
#TODO: Organizar as TAGS.


Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Resource    ${EXEC_DIR}/resources/base.robot
Library     ${EXECDIR}/resources/libraries/nova.py

*** Variables ***
${USERS_IMAGE_DIR}          ${EXECDIR}\\resources\\elements\\users

*** Keywords ***
Add Needed Users Image Path
    Add Image Path      ${USERS_IMAGE_DIR}

Add All Image Path
    Add Needed Users Image Path
    Add Needed Image Path

Go to Users Management
    Dado que estou logado no sistema
    Click     SQR4-Sistema.png
    Click     SQR4-Sistema-Usuarios.png
    Screen Should Coutain     users-management-page.png
    Click     propriedades-de-usuario.png
    Screen Should Contain     pg-propriedades-de-usuario.png
    Click     novo-usuario.png
    Screen Should Contain     criar-novo-usuario.png

Invalid Try
    Click     confirm-user.png
    Wait Until Screen Contain   aviso-1-usuario-invalido.png
    Input Text                  input-username         teste

Empty Details
    



