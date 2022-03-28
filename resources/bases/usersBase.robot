*** Settings ***
#TODO: Organizar nome dos testes.
#TODO: Organizar as TAGS.


Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Resource    ${EXECDIR}/resources/bases/base.robot
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
    Wait Until Screen Contain     users-management-page.png       ${TEMPO}
    Click     propriedades-de-usuario.png
    Wait Until Screen Contain     pg-propriedades-de-usuario.png  ${TEMPO}
    Sleep     1
    Click     novo-usuario.png
    Wait Until Screen Contain     criar-novo-usuario.png          ${TEMPO}

Empty User
    Click     confirm-user.png
    Wait Until Screen Contain   aviso-1-usuario-invalido.png      ${TEMPO}
   

Empty Details
    Input Text                  input-username.png              teste
    Press Special Key           TAB
    Input Text                  ${EMPTY}                        teste
    Press Special Key           TAB
    Input Text                  ${EMPTY}                        teste
    Click     confirm-user.png
    Wait Until Screen Contain   empty-authority.png             ${TEMPO}

    Click     authority-box.png
    Sleep     1
    Press Special Key           DOWN   
    Press Special Key           ENTER
    Press Special Key           TAB
    Click     confirm-user.png
    Wait Until Screen Contain   empty-function.png             ${TEMPO}

    Click     function1-box.png
    Sleep     1
    Press Special Key           DOWN
    Press Special Key           ENTER
    Press Special Key           TAB
    Click     confirm-user.png
    Wait Until Screen Contain   empty-class.png             ${TEMPO}

    Click     function2-box.png
    Sleep     1
    Press Special Key           DOWN
    Press Special Key           ENTER
    Press Special Key           TAB
    Click     confirm-user.png

Close Users Proprieties
    Right Click                 pg-propriedades-de-usuario.png
    Click                       fechar-propriedades-de-usuario.png

    
    



