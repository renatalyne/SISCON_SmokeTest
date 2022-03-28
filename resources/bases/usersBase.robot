*** Settings ***
#TODO: Organizar nome dos testes.
#TODO: Organizar as TAGS.


Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Resource    ${EXECDIR}\\resources\\bases\\base.robot
Library     ${EXECDIR}\\resources\\libraries\\nova.py

*** Variables ***
${USERS_IMAGE_DIR}          ${EXECDIR}\\resources\\elements\\Usuario

*** Keywords ***

Add Users Image Path
    Add Base Image Path
    Add Image Path      ${USERS_IMAGE_DIR}

Go to Users Management
    Click     Sistema.png
    Click     Sistema-Usuarios.png
    Wait Until Screen Contain     UsuarioWindow.png       ${TEMPO}
    Click     PropriedadeDoUsuario.png
    Wait Until Screen Contain     PropriedadeDoUsuarioWindow.png  ${TEMPO}
    Sleep     1
    Click     NovoUsuario.png
    Wait Until Screen Contain     CriaNovoUsuario.png          ${TEMPO}

Empty User
    Click     ConfirmUser.png
    Wait Until Screen Contain   Error1UsuarioInvalido.png      ${TEMPO}
   

Empty Details
    Input Text                  InputUsuario.png              teste
    Press Special Key           TAB
    Input Text                  ${EMPTY}                        teste
    Press Special Key           TAB
    Input Text                  ${EMPTY}                        teste
    Click     ConfirmUser.png
    Wait Until Screen Contain   Error2EmptyAuthority.png         ${TEMPO}

    Click     AuthorityBox.png
    Sleep     1
    Press Special Key           DOWN   
    Press Special Key           ENTER
    Press Special Key           TAB
    Click     ConfirmUser.png
    Wait Until Screen Contain   Error3EmptyFunction.png             ${TEMPO}

    Click     Function1Box.png
    Sleep     1
    Press Special Key           DOWN
    Press Special Key           ENTER
    Press Special Key           TAB
    Click     ConfirmUser.png
    Wait Until Screen Contain   Error4EmptyClass.png             ${TEMPO}

    Click     Function2Box.png
    Sleep     1
    Press Special Key           DOWN
    Press Special Key           ENTER
    Press Special Key           TAB
    Click     ConfirmUser.png

Close Users Proprieties
    Right Click                 PropriedadeDoUsuarioWindow.png
    Click                       PropriedadeDoUsuarioWindowClose.png

    
    



