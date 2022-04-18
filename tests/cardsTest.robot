*** Settings ***

Resource          ${EXECDIR}/resources/bases/cardsBase.robot
Test Setup        Add Cards Image Path

Test Teardown     Stop Remote Server


*** Variables ***
${Login}                testeQA
${Environment}          dvl
${Nome_B1}              US-S3
${Nome_B2}              13
${Nome_B3}              Bay7  
${TA_Selecionado}       TASelecionado(Dvl).png
${Tela_Selecionada}     USS3-13-Bay7Window.png
${Ponto}                Point(Dvl).PNG

*** Test Cases ***

###########################################################################
# Cenário 1-10: Abre cada uma das telas dos cartões e verifica se elas carregam
###########################################################################

Cenário 00: Setup
    [Tags]      Cenário 00
        IF      "${Environment}" == "dvl"     

            set Global Variable      ${Nome_B1}             US-S3
            set Global Variable      ${Nome_B2}             13
            set Global Variable      ${Nome_B3}             Bay7
            set Global Variable      ${TA_Selecionado}      TASelecionado(Dvl).png
            set Global Variable      ${Tela_Selecionada}    USS3-13-Bay7Window.png
            set Global Variable      ${Ponto}               Point(Dvl).PNG

        END   
        IF      "${Environment}" == "admmst"     
            
            set Global Variable      ${Nome_B1}             BVG
            set Global Variable      ${Nome_B2}             69
            set Global Variable      ${Nome_B3}             12Z3
            set Global Variable      ${TA_Selecionado}      TASelecionado(admmst).png
            set Global Variable      ${Tela_Selecionada}    BVG-69-12Z3Window.PNG
            set Global Variable      ${Ponto}               Point(Admmst).PNG


        END


        Close all non-BaSiDi windows
        And clicked on "Cartões"
    [Teardown]


Cenário 01: Open the "Geral" screen in "Cartões"
    [Tags]      Cenário 01
        ${Cartoes_Custom}   set Variable    Cartoes-Geral.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-Geral.PNG
        log     "Abrir tela Geral em Cartões"
        Given that I'm in BaSiDi
        And clicked on "Cartões"
        And clicked on Cartoes-Custom           ${Cartoes_Custom}
        Then the Cards screen should appeared   ${Cartoes_Custom_Window}
        Close card window                       ${Cartoes_Custom_Window}
    [Teardown]

Cenário 02: Open the "Objeto em Teste" screen in "Cartões"
    [Tags]      Cenário 02
        ${Cartoes_Custom}           set Variable    Cartoes-ObjetoEmTeste.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-ObjetoEmTeste.PNG
        log     "Abrir tela Objeto em Teste em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom           ${Cartoes_Custom}
        Then the Cards screen should appeared   ${Cartoes_Custom_Window}
        Close card window                       ${Cartoes_Custom_Window}
    [Teardown]

Cenário 03: Open the "Cartão de Informação" screen in "Cartões"
    [Tags]      Cenário 03
        ${Cartoes_Custom}           set Variable    Cartoes-CartaoDeInformacao.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-CartaoDeInformacao.PNG
        log     "Abrir tela Cartão de Informação em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom           ${Cartoes_Custom}
        Then the Cards screen should appeared   ${Cartoes_Custom_Window}
        Close card window                       ${Cartoes_Custom_Window}
    [Teardown]

Cenário 04: Open the "Removido de Operação" screen in "Cartões"
    [Tags]      Cenário 04
        ${Cartoes_Custom}           set Variable    Cartoes-RemovidoDeOperacao.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-RemovidoDeOperacao.PNG
        log     "Abrir tela Removido de Operação em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom           ${Cartoes_Custom}
        Then the Cards screen should appeared   ${Cartoes_Custom_Window}
        Close card window                       ${Cartoes_Custom_Window}
    [Teardown]

Cenário 05: Open the "Alarme Inibido" screen in "Cartões"
    [Tags]      Cenário 05
        ${Cartoes_Custom}           set Variable    Cartoes-AlarmeInibido.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-AlarmeInibido.PNG
        log     "Abrir tela Alarme Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom           ${Cartoes_Custom}
        Then the Cards screen should appeared   ${Cartoes_Custom_Window}
        Close card window                       ${Cartoes_Custom_Window}
    [Teardown]

Cenário 06: Open the "Cartão Atenção" screen in "Cartões"
    [Tags]      Cenário 06
        ${Cartoes_Custom}           set Variable    Cartoes-CartaoAtencao.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-CartaoAtencao.PNG
        log     "Abrir tela Cartão Atenção em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom           ${Cartoes_Custom}
        Then the Cards screen should appeared   ${Cartoes_Custom_Window}
        Close card window                       ${Cartoes_Custom_Window}
    [Teardown]

Cenário 07: Open the "Controle Inibido" screen in "Cartões"
    [Tags]      Cenário 07
        ${Cartoes_Custom}   set Variable    Cartoes-ControleInibido.PNG
        ${Cartoes_Custom_Window}   set Variable    CartoesWindow-ControleInibido.PNG
        log     "Abrir tela Controle Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom           ${Cartoes_Custom}
        Then the Cards screen should appeared   ${Cartoes_Custom_Window}
        Close card window                       ${Cartoes_Custom_Window}
    [Teardown]

Cenário 08: Open the "Cartão AGR" screen in "Cartões"
    [Tags]      Cenário 08
        ${Cartoes_Custom}          set Variable    Cartoes-CartaoAGR.PNG
        ${Cartoes_Custom_Window}   set Variable    CartoesWindow-CartaoAGR.PNG
        log     "Abrir tela Cartão AGR em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom           ${Cartoes_Custom}
        Then the Cards screen should appeared   ${Cartoes_Custom_Window}
        Close card window                       ${Cartoes_Custom_Window}
    [Teardown]

Cenário 09: Open Display list 
    [Tags]      Cenário 09
        log   "Abrir a Lista de Telas"
        Given that I'm in BaSiDi
        And clicked on "Lista de Telas"
        Then the Display list screen should appeared
    [Teardown]

Cenário 10: Input Desired TA
    [Tags]      Cenário 10
        log   "Abrir tela desejada em Lista de Telas"
        When the input box is clicked
        And filled the input box    ${Nome_B1}      ${Nome_B2}      ${Nome_B3}
        And the display list finished loading 
        And clicked on the "Chamar" button          ${TA_Selecionado}
        Then the selected screen should appeared    ${Tela_Selecionada}
    [Teardown]

###########################################################################
# Cenário 11 - 14: Teste Removido de Operação
###########################################################################
Cenário 11: Add "Removido de Operação" card to point
    [Tags]      Cenário 11
        ${Cartao}           set Variable     point-Cartoes-DefinirRemovidoDeOperacao.png
        ${ExcluirCartao}    set Variable     point-Cartoes-ExcluirRemovidoDeOperacao.png
        log   "Definir Removido de Operação em um point"
        When the point is selected              ${Ponto}
        And clicked on point-Cartoes
        And clicked on point-Cartoes-Custom     ${Cartao}
        And filled the TAInformation card
        Then the card should be applied/removed     ${Ponto}    ${Cartao}   ${ExcluirCartao}    ${True}
    [Teardown]

Cenário 12: Verify "Removido de Operação" screen in "Cartões"
    [Tags]      Cenário 12
        ${Cartoes_Custom}   set Variable    Cartoes-RemovidoDeOperacao.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-RemovidoDeOperacao.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao(${Environment}).PNG       

        log     "Verificar tela Removido de Operação em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}    
        Then the screen should/shouldn't contain the Custom card      ${Nome_B1}      ${Nome_B2}      ${Nome_B3}      ${Cartoes_Report}     ${Cartoes_Custom_Window}    ${True}
        Close card window              ${Cartoes_Custom_Window}
    [Teardown]

Cenário 13: Delete "Removido de Operação" card from the point
    [Tags]      Cenário 13
        ${Cartao}           set Variable     point-Cartoes-DefinirRemovidoDeOperacao.png
        ${ExcluirCartao}    set Variable     point-Cartoes-ExcluirRemovidoDeOperacao.png
        log     "Exclui Removido de Operação em Cartões"
        When the point is selected              ${Ponto}     
        And clicked on point-Cartoes
        And clicked on point-Cartoes-ExcluirCustom      ${ExcluirCartao}  
        Then the card should be applied/removed     ${Ponto}    ${Cartao}   ${ExcluirCartao}    ${False}
    [Teardown]

Cenário 14: Verify "Removido de Operação" screen in "Cartões"
    [Tags]      Cenário 14
        ${Cartoes_Custom}   set Variable    Cartoes-RemovidoDeOperacao.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-RemovidoDeOperacao.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao(${Environment}).PNG   

        log     "Verificar tela Removido de Operação em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should/shouldn't contain the Custom card  ${Nome_B1}      ${Nome_B2}      ${Nome_B3}      ${Cartoes_Report}       ${Cartoes_Custom_Window}    ${False}
        Close card window              ${Cartoes_Custom_Window}
    [Teardown]


###########################################################################
# Cenário 15 - 18: Teste Controle Inibido
###########################################################################

Cenário 15: Add "Controle Inibido" card to point
    [Tags]      Cenário 15
        ${Cartao}           set Variable     point-Cartoes-DefinirControleInibido.png
        ${ExcluirCartao}    set Variable     point-Cartoes-ExcluirControleInibido.png
        log   "Definir Controle Inibido em um point"
        When the point is selected              ${Ponto}
        And clicked on point-Cartoes
        And clicked on point-Cartoes-Custom     ${Cartao}
        And filled the TAInformation card
        Then the card should be applied/removed    ${Ponto}  ${Cartao}   ${ExcluirCartao}    ${True}
    [Teardown]

Cenário 16: Verify "Controle Inibido" screen in "Cartões"
    [Tags]      Cenário 16
        ${Cartoes_Custom}   set Variable    Cartoes-ControleInibido.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-ControleInibido.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao(${Environment}).PNG   

        log     "Verificar tela Controle Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}    
        Then the screen should/shouldn't contain the Custom card      ${Nome_B1}      ${Nome_B2}      ${Nome_B3}      ${Cartoes_Report}     ${Cartoes_Custom_Window}    ${True}
        Close card window              ${Cartoes_Custom_Window}
    [Teardown]

Cenário 17: Delete "Controle Inibido" card from the point
    [Tags]      Cenário 17
        ${Cartao}           set Variable     point-Cartoes-DefinirControleInibido.png
        ${ExcluirCartao}    set Variable     point-Cartoes-ExcluirControleInibido.png       
        log     "Exclui Controle Inibido em Cartões"
        When the point is selected              ${Ponto}
        And clicked on point-Cartoes
        And clicked on point-Cartoes-ExcluirCustom      ${ExcluirCartao}  
        Then the card should be applied/removed    ${Ponto}  ${Cartao}   ${ExcluirCartao}    ${False}
    [Teardown]

Cenário 18: Verify "Controle Inibido" screen in "Cartões"
    [Tags]      Cenário 18
        ${Cartoes_Custom}   set Variable    Cartoes-ControleInibido.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-ControleInibido.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao(${Environment}).PNG   

        log     "Verificar tela Controle Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}    
        Then the screen should/shouldn't contain the Custom card      ${Nome_B1}      ${Nome_B2}      ${Nome_B3}      ${Cartoes_Report}     ${Cartoes_Custom_Window}    ${False}
        Close card window              ${Cartoes_Custom_Window}
    [Teardown]

###########################################################################
# Cenário 19 - 22: Teste Alarme Inibido
###########################################################################

Cenário 19: Add "Alarme Inibido" card to point
    [Tags]      Cenário 19
        ${Cartao}           set Variable     point-Cartoes-DefinirAlarmeInibido.png
        ${ExcluirCartao}    set Variable     point-Cartoes-ExcluirAlarmeInibido.png
        log   "Definir Alarme Inibido em um point"
        When the point is selected          ${Ponto}
        And clicked on point-Cartoes
        And clicked on point-Cartoes-Custom            ${Cartao}
        And filled the TAInformation card
        Then the card should be applied/removed    ${Ponto}  ${Cartao}   ${ExcluirCartao}    ${True}
    [Teardown]

Cenário 20: Verify "Alarme Inibido" screen in "Cartões"
    [Tags]      Cenário 20
        ${Cartoes_Custom}   set Variable    Cartoes-AlarmeInibido.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-AlarmeInibido.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao(${Environment}).PNG          

        log     "Verificar tela Alarme Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should/shouldn't contain the Custom card      ${Nome_B1}      ${Nome_B2}      ${Nome_B3}      ${Cartoes_Report}     ${Cartoes_Custom_Window}    ${True}
        Close card window              ${Cartoes_Custom_Window}
    [Teardown]

Cenário 21: Delete "Alarme Inibido" card from the point
    [Tags]      Cenário 21
        ${Cartao}           set Variable     point-Cartoes-DefinirAlarmeInibido.png
        ${ExcluirCartao}    set Variable     point-Cartoes-ExcluirAlarmeInibido.png
        log     "Exclui Alarme Inibido em Cartões"
        When the point is selected          ${Ponto}
        And clicked on point-Cartoes
        And clicked on point-Cartoes-ExcluirCustom     ${ExcluirCartao}  
        Then the card should be applied/removed     ${Ponto}    ${Cartao}   ${ExcluirCartao}    ${False}
    [Teardown]

Cenário 22: Verify "Alarme Inibido" screen in "Cartões"
    [Tags]      Cenário 22
        ${Cartoes_Custom}   set Variable    Cartoes-AlarmeInibido.PNG
        ${Cartoes_Custom_Window}    set Variable    CartoesWindow-AlarmeInibido.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao(${Environment}).PNG   

        log     "Verificar tela Alarme Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should/shouldn't contain the Custom card      ${Nome_B1}      ${Nome_B2}      ${Nome_B3}      ${Cartoes_Report}     ${Cartoes_Custom_Window}    ${False}
        Close card window              ${Cartoes_Custom_Window}
    [Teardown]

Cenário 23: Close Windows
    [Tags]      Cenário 23 
        Close all non-BaSiDi windows
    [Teardown]
