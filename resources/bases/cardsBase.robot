*** Settings ***

Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Resource    ${EXECDIR}\\resources\\bases\\base.robot
Library     ${EXECDIR}\\resources\\libraries\\nova.py

*** Variables ***
${CARDS_IMAGE_DIR}          ${EXECDIR}\\resources\\elements\\Cartoes
${CARDS_IMAGE_DIR2}          ${EXECDIR}\\resources\\elements\\TA

*** Keywords ***

Add Cards Image Path
    Add Base Image Path
    Add Image Path      ${CARDS_IMAGE_DIR}
    Add Image Path      ${CARDS_IMAGE_DIR2}

When the point is selected
    [Arguments]         ${Ponto}
    Right Click         ${Ponto}

And the display list finished loading 
    Wait Until Screen Contain           Carregamento.png       60
    Wait Until Screen not Contain       Carregamento.png       60

And clicked on the "Chamar" button
    [Arguments]         ${TA_Selecionado}
    Click               ${TA_Selecionado}      220  0

And clicked on point-Cartoes
    Click                       point-Cartoes.png

And clicked on point-Cartoes-Custom
    [Arguments]         ${Cartao} 
    Click               ${Cartao} 

And filled the TAInformation card
    Input Text          DefinirInformaçõesTA-Comentario.PNG       Automacao
    Click               DefinirInformaçõesTA-Aplicar.PNG
    
And clicked on point-Cartoes-ExcluirCustom
    [Arguments]         ${ExcluirCartao}
    Click                      ${ExcluirCartao}
    Sleep                      2
    Wait Until Screen Not Contain   CartaoExcluir.png     ${TEMPO}
    Click                      CartaoExcluir2.png      -50       80

And refresh the search bar
    Click                       FiltroLaranja.PNG
    Mouse Move                  conectado.png
    Click                       FiltroAzul.PNG

And filled the card search bar
    [Arguments]     ${Nome_B1}      ${Nome_B2}      ${Nome_B3}
    Click                       InputBoxCard.png
    Input Text          ${EMPTY}            ${Nome_B1}
    Press Special Key           TAB
    Press Special Key           TAB
    Input Text          ${EMPTY}            ${Nome_B2}
    Press Special Key           TAB
    Press Special Key           TAB
    Input Text          ${EMPTY}            ${Nome_B3}
    Press Special Key           ENTER

Then the Cards screen should appeared
    [Arguments]                 ${Cartoes_Custom_Window}
    # Wait Until Screen Contain           Carregamento.png       30
    # Wait Until Screen not Contain       Carregamento.png       30
    Sleep               5
    ${score}        Get Match Score     ${Cartoes_Custom_Window}
    IF      ${score} < 0.92     
        Fail    Given image did not achieve the ${score} score.
    END

Then the Display list screen should appeared
    Wait Until Screen Contain   ListaDeTelasWindow.PNG     30

Then the selected screen should appeared
    [Arguments]                 ${Tela_Selecionada}
    Wait Until Screen Contain   ${Tela_Selecionada}     30

Then the card should be applied/removed
    [Arguments]                     ${Ponto}    ${Cartao}   ${ExcluirCartao}    ${Applied}
    When the point is selected      ${Ponto}
    And clicked on point-Cartoes
    IF  ${Applied} == True
        Wait Until Screen Contain   ${ExcluirCartao}    ${TEMPO}
    ELSE
        Wait Until Screen Contain   ${Cartao}           ${TEMPO} 
    END
    Click                           conectado.png    

Then the screen should/shouldn't contain the Custom card
    [Arguments]                     ${Nome_B1}      ${Nome_B2}      ${Nome_B3}  ${Cartoes_Report}   ${Cartoes_Custom_Window}    ${Should_Contain}
    Then the Cards screen should appeared   ${Cartoes_Custom_Window}
    and refresh the search bar
    And filled the card search bar  ${Nome_B1}      ${Nome_B2}      ${Nome_B3}
    Sleep                           2
    IF  ${Should_Contain} == True
        Wait Until Screen Contain       ${Cartoes_Report}     ${TEMPO}
    ELSE
        Wait Until Screen Not Contain   ${Cartoes_Report}     ${TEMPO}
    END

Close card window 
    [Arguments]                 ${Cartoes_Custom_Window}
    Right Click                 ${Cartoes_Custom_Window}
    Click                       fechar4.png
