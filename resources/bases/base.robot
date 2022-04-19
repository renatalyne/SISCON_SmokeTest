*** Settings ***

Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Library     ${EXECDIR}\\resources\\libraries\\nova.py


*** Variables ***

${IMAGE_DIR}       ${EXECDIR}\\resources\\elements\\BaSiDi
${IMAGE_DIR2}      ${EXECDIR}\\resources\\elements\\Windows
${IMAGE_DIR3}      ${EXECDIR}\\resources\\elements\\ListaDeTelas
${IMAGE_DIR4}      ${EXECDIR}\\resources\\elements\\Icones
${PATH}            C:\\Program Files\\Siemens\\SpectrumPower7\\odvlauncher
${EXEC_SPECTRUM}   odvlauncher.exe -admin
${TEMPLATE_DIR}    C:\\temp\\template.txt
${TEMPO}           10
${SLEEP}           40
${TIPO2}           Ocorrência indefinida
${MAQUINA}         dvl81ibd
${LOGIN}           psene
${PASSWORD}        jS4BvgnjmCXtgnTs
${present}         Run Keyword and Return Status    Screen Should Contain    sp7-close-symbol.png


${TACOMANDO}               ta/US-S3/13/Bay7/CB/Status
${TA}                      US-S3/13/Bay7


*** Keywords ***

Add Base Image Path
    Add Image Path         ${IMAGE_DIR}
    Add Image Path         ${IMAGE_DIR2}
    Add Image Path         ${IMAGE_DIR3}
    Add Image Path         ${IMAGE_DIR4}

Close all non-BaSiDi windows
    ${score}        Get Match Score     Fechar3.PNG

    FOR    ${counter}   IN RANGE    0   9999
        ${score}        Get Match Score     Fechar3.PNG
        Exit For Loop If  ${score} < 0.92 

        Click                   Fechar3.PNG     15      0 
        Mouse Move              BasidiWindow.PNG   
        Sleep                   1

    END

Given that I'm in BaSiDi
    Screen Should Contain            Conectado.PNG

And clicked on "Trocar Usuário"
    Click                            TrocarUsuário.PNG

And clicked on "Cartões"
    Click                            Cartoes.PNG
    
And clicked on Cartoes-Custom
    [Arguments]                      ${Cartoes_Custom}        
    Click                            ${Cartoes_Custom}

And clicked on "Lista de Telas"
     Click                            ListaDeTelas.PNG


And try to close BasiDi
    Click                            Fechar.PNG     10      0 
    ${exits}      Exists       FecharWarning.PNG       2
    IF     "${exits}" == "true"
        Click                        FecharWarning.PNG      100     140
    ELSE
        Click                        OK.PNG
    END  

Then BasiDi should be closed sucessfully
    Wait Until Screen Not Contain    FecharWarning.PNG      ${TEMPO}

When BaSiDi Login screen is opened
    [Arguments]         ${ENVIRONMENT} 
    Click               BarraDeBusca.PNG
    Sleep               0.5
    Input Text          ${Empty}            cmd
    Wait Until Screen Contain               CMD.png         ${TEMPO}
    Click               CMD.png
    Sleep               0.5
    Paste Text          ${Empty}            cd ${PATH}
    Press Special Key   ENTER
    Paste Text         ${Empty}             ${EXEC_SPECTRUM}
    Press Special Key   ENTER
    Click               CMDWindows1.PNG     850     0
    Double Click               ${ENVIRONMENT}     -50     0

Then an security message should appeared
    Wait Until Screen Contain               LoginFechar.PNG     ${TEMPO}

When the BaSiDi Login screen is filled 
    [Arguments]     ${Login}        ${Password}
    Click               LoginFechar.PNG     15
    Sleep               0.5
    Input Text          LoginUsuario.PNG    ${Login} 
    Press Special Key   TAB
    Input Text          ${EMPTY}            ${Password}
    Press Special Key   ENTER

Then an expered password message should appeared
    Wait Until Screen Contain               LoginError1.PNG     ${TEMPO}

When the BaSiDi new password field is filled
    [Arguments]     ${Password}
    Paste Text         ${Empty}             ${Password}
    Press Special Key   TAB
    Sleep               0.5
    Paste Text         ${Empty}             ${Password}
    Press Special Key   ENTER

Then and short password message should appeared
    Wait Until Screen Contain               LoginError2.PNG     ${TEMPO}

Then and no numeric in password message should appeared
    Wait Until Screen Contain               LoginError3.PNG     ${TEMPO}

Then the sucesfull password changed successfully message should appeared
    Wait Until Screen Contain               PasswordChangedSuccessfully.PNG     ${TEMPO}

Then the BaSiDi screen should appeared
    Wait Until Screen Contain               ConectadoSelecionado.PNG      ${TEMPO}

When the input box is clicked
    Click                       InputBox.PNG        0    5

And filled the input box
    [Arguments]         ${Nome_B1}      ${Nome_B2}      ${Nome_B3}
    Input Text          ${EMPTY}            ${Nome_B1}
    Press Special Key           TAB
    Input Text          ${EMPTY}            ${Nome_B2}
    Press Special Key           TAB
    Input Text          ${EMPTY}            ${Nome_B3}
    Press Special Key           ENTER
