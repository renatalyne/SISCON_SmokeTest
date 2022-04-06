*** Settings ***
#TODO: Organizar nome dos testes.
#TODO: Organizar as TAGS.


Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Resource    ${EXECDIR}\\resources\\bases\\base.robot
Library     ${EXECDIR}\\resources\\libraries\\nova.py

*** Variables ***
${CARDS_IMAGE_DIR}          ${EXECDIR}\\resources\\elements\\Cartoes
${CARDS_IMAGE_DIR2}          ${EXECDIR}\\resources\\elements\\ListaDeTelas
${CARDS_IMAGE_DIR3}          ${EXECDIR}\\resources\\elements\\TA

*** Keywords ***

Add Cards Image Path
    Add Base Image Path
    Add Image Path      ${CARDS_IMAGE_DIR}
    Add Image Path      ${CARDS_IMAGE_DIR2}
    Add Image Path      ${CARDS_IMAGE_DIR3}


When the input box is clicked
    Click                       InputBox.PNG        -60     10

When the CB is selected
    Right Click                 CB.PNG              -45


And filled the input box
    Input Text          ${EMPTY}            US-S3
    Press Special Key           TAB
    Input Text          ${EMPTY}            13
    Press Special Key           TAB
    Input Text          ${EMPTY}            Bay7
    Press Special Key           ENTER

And clicked on the "Chamar" button
    Click                       TASelecionado.PNG      220  0

And clicked on CB-Cartoes
    Click                       CB-Cartoes.png

And clicked on CB-Cartoes-Custom
    [Arguments]         ${Cartao} 
    # Click                       CB-Cartoes-DefinirAlarmeInibido.png
    Click                       ${Cartao} 

And filled the TAInformation card
    Input Text          DefinirInformaçõesTA-Comentario.PNG       Automacao
    Click                       DefinirInformaçõesTA-Aplicar.PNG
    
And clicked on CB-Cartoes-ExcluirCustom
    [Arguments]         ${ExcluirCartao}
    Click                      ${ExcluirCartao}
    Sleep                      2
    Wait Until Screen Not Contain   CartaoExcluir.png     ${TEMPO}
    Click                      CartaoExcluir2.png      -50       80


Then the Cards screen should appeared
    Wait Until Screen Contain   CartoesWindow.PNG     30

Then the Display list screen should appeared
    Wait Until Screen Contain   ListaDeTelasWindow.PNG     30

Then the US-S3/13/Bay7 screen should appeared
    Wait Until Screen Contain   USS3-13-Bay7Window.png     30

Then the card should be applied
    [Arguments]                 ${ExcluirCartao}
    When the CB is selected
    And clicked on CB-Cartoes
    Wait Until Screen Contain   ${ExcluirCartao}       ${TEMPO}

Then the card should be removed
    [Arguments]                 ${Cartao} 
    When the CB is selected
    And clicked on CB-Cartoes
    Wait Until Screen Contain   ${Cartao}        ${TEMPO} 

Then the screen should contain the Custom card
    [Arguments]                 ${Cartoes_Report}
    Then the cards screen should appeared
    Wait Until Screen Contain   ${Cartoes_Report}     30

Then the screen should not contain the Custom card
    [Arguments]                 ${Cartoes_Report}
    Then the cards screen should appeared
    Sleep                           5
    Wait Until Screen Not Contain   ${Cartoes_Report}     ${TEMPO}

Close card window 
    Click                       CartoesWindow.PNG
    Key Down                    ALT
    Press Special Key           F4
    Key Up                      ALT 
    Sleep                       3
    # Wait Until Screen Not Contain      CartoesWindow.PNG       ${TEMPO}