*** Settings ***

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


And Clicked on "Sistemas"
    Click     Sistema.png


And Clicked on "Usuários"
    Click     Sistema-Usuarios.png

When "Propriedades do usuário" is clicked
    Click     PropriedadeDoUsuario.png

Then the Users Management should appeared 
    Wait Until Screen Contain     UsuarioWindow.png         ${TEMPO}

Then the Users Proprieties should appeared
    Wait Until Screen Contain     PropriedadeDoUsuarioWindow.png  ${TEMPO}

And Clicked on "Criar novo Usuário"
    Sleep     1
    Click     NovoUsuario.png

Then the create new user should appeared
    Wait Until Screen Contain     CriaNovoUsuario.png          ${TEMPO}

When user test is selected
    [Arguments]                 ${Usuario_Teste}
    Click     ${Usuario_Teste}
    
And the delete button is clicked
    Click     DeletarUsuario.PNG
    Click     ConfirmarDeletarUsuario.PNG

Then user this should desapear
    Wait Until Screen Not Contain     UsuarioTeste.PNG          ${TEMPO}
    

And try to create user
    Click     ConfirmUser.png


Then the invalid user message should appeared
    Wait Until Screen Contain   Error1UsuarioInvalido.png      ${TEMPO}
   
And fill the login and password field
    [Arguments]                 ${Login}             ${Senha}
    Input Text                  InputUsuario.png        ${Login}
    Press Special Key           TAB
    Input Text                  ${EMPTY}                ${Senha}
    Press Special Key           TAB
    Input Text                  ${EMPTY}                ${Senha}

Then the invalid authority message should appeared
    Wait Until Screen Contain   Error2EmptyAuthority.png         ${TEMPO}

And fill the authority field
    Click     AuthorityBox.png
    Sleep     1
    Press Special Key           DOWN   
    Press Special Key           ENTER
    Press Special Key           TAB


Then the invalid function message should appeared
    Wait Until Screen Contain   Error3EmptyFunction.png             ${TEMPO}

And fill the function field
    Click     Function1Box.png
    Sleep     1
    Press Special Key           DOWN
    Press Special Key           ENTER
    Press Special Key           TAB


Then the invalid class message should appeared
    Wait Until Screen Contain   Error4EmptyClass.png             ${TEMPO}

And fill the class field
    Click     Function2Box.png
    Sleep     1
    Press Special Key           DOWN
    Press Special Key           ENTER
    Press Special Key           TAB
    
Then the successful new user creation message appeared 
    Wait Until Screen Contain   CriaNovoUsuarioSucesso.png       ${TEMPO}


Close Users Proprieties
    Right Click                 PropriedadeDoUsuarioWindow.png
    Click                       Fechar4.png

    
    



