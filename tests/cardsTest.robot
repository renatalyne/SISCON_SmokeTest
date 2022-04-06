*** Settings ***

Resource          ${EXECDIR}/resources/bases/cardsBase.robot
Test Setup        Add Cards Image Path

Test Teardown     Stop Remote Server


*** Test Cases ***

#Given
#And
#When
#Then

###########################################################################
# Cenário 1-10: Abre cada uma das telas dos cartões e verifica se elas carregam
###########################################################################

Cenário 1: Open the "Geral" screen in "Cartões"
    [Tags]      Cenário 1
        ${Cartoes_Custom}   set Variable    Cartoes-Geral.PNG
        log     "Abrir tela Geral em Cartões"
        Given that I'm in BaSiDi
        And clicked on "Cartões"
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the Cards screen should appeared
        Close card window 
    [Teardown]

Cenário 2: Open the "Objeto em Teste" screen in "Cartões"
    [Tags]      Cenário 2
        ${Cartoes_Custom}   set Variable    Cartoes-ObjetoEmTeste.PNG
        log     "Abrir tela Objeto em Teste em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the Cards screen should appeared
        Close card window 
    [Teardown]

Cenário 3: Open the "Cartão de Informação" screen in "Cartões"
    [Tags]      Cenário 3
        ${Cartoes_Custom}   set Variable    Cartoes-CartaoDeInformacao.PNG
        log     "Abrir tela Cartão de Informação em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the Cards screen should appeared
        Close card window
    [Teardown]

Cenário 4: Open the "Removido de Operação" screen in "Cartões"
    [Tags]      Cenário 4
        ${Cartoes_Custom}   set Variable    Cartoes-RemovidoDeOperacao.PNG
        log     "Abrir tela Removido de Operação em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the Cards screen should appeared
        Close card window
    [Teardown]

Cenário 5: Open the "Alarme Inibido" screen in "Cartões"
    [Tags]      Cenário 5
        ${Cartoes_Custom}   set Variable    Cartoes-AlarmeInibido.PNG
        log     "Abrir tela Alarme Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the Cards screen should appeared
        Close card window
    [Teardown]

Cenário 6: Open the "Cartão Atenção" screen in "Cartões"
    [Tags]      Cenário 6
        ${Cartoes_Custom}   set Variable    Cartoes-CartaoAtencao.PNG
        log     "Abrir tela Cartão Atenção em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the Cards screen should appeared
        Close card window
    [Teardown]

Cenário 7: Open the "Controle Inibido" screen in "Cartões"
    [Tags]      Cenário 7
        ${Cartoes_Custom}   set Variable    Cartoes-ControleInibido.PNG
        log     "Abrir tela Controle Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the Cards screen should appeared
        Close card window
    [Teardown]

Cenário 8: Open the "Cartão AGR" screen in "Cartões"
    [Tags]      Cenário 8
        ${Cartoes_Custom}   set Variable    Cartoes-CartaoAGR.PNG
        log     "Abrir tela Cartão AGR em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the Cards screen should appeared
        Close card window
    [Teardown]

Cenário 9: Open Display list 
    [Tags]      Cenário 9
        log   "Abrir a Lista de Telas"
        Given that I'm in BaSiDi
        And clicked on "Lista de Telas"
        Then the Display list screen should appeared
    [Teardown]

Cenário 10: Input US-S3/13/Bay7
    [Tags]      Cenário 10
        log   "Abrir tela US-S3/13/Bay7 em Lista de Telas"
        When the input box is clicked
        And filled the input box
        And clicked on the "Chamar" button
        Then the US-S3/13/Bay7 screen should appeared
    [Teardown]

###########################################################################
# Cenário 11 - 14: Teste Removido de Operação
###########################################################################
Cenário 11: Add "Removido de Operação" card to CB
    [Tags]      Cenário 11
        ${Cartao}           set Variable     CB-Cartoes-DefinirRemovidoDeOperacao.png
        ${ExcluirCartao}    set Variable     CB-Cartoes-ExcluirRemovidoDeOperacao.png
        log   "Definir Removido de Operação em um CB"
        When the CB is selected
        And clicked on CB-Cartoes
        And clicked on CB-Cartoes-Custom     ${Cartao}
        And filled the TAInformation card
        Then the card should be applied      ${ExcluirCartao}
    [Teardown]

Cenário 12: Verify "Removido de Operação" screen in "Cartões"
    [Tags]      Cenário 12
        ${Cartoes_Custom}   set Variable    Cartoes-RemovidoDeOperacao.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao.PNG
        log     "Verificar tela Removido de Operação em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should contain the Custom card      ${Cartoes_Report}
        Close card window
    [Teardown]

Cenário 13: Delete "Removido de Operação" card from the CB
    [Tags]      Cenário 13
        ${Cartao}           set Variable     CB-Cartoes-DefinirRemovidoDeOperacao.png
        ${ExcluirCartao}    set Variable     CB-Cartoes-ExcluirRemovidoDeOperacao.png
        log     "Exclui Removido de Operação em Cartões"
        When the CB is selected
        And clicked on CB-Cartoes
        And clicked on CB-Cartoes-ExcluirCustom      ${ExcluirCartao}  
        Then the card should be removed                     ${Cartao} 
    [Teardown]

Cenário 14: Verify "Removido de Operação" screen in "Cartões"
    [Tags]      Cenário 14
        ${Cartoes_Custom}   set Variable    Cartoes-RemovidoDeOperacao.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao.PNG
        log     "Verificar tela Removido de Operação em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should not contain the Custom card  ${Cartoes_Report}
        Close card window
    [Teardown]

###########################################################################
# Cenário 15 - 18: Teste Controle Inibido
###########################################################################

Cenário 15: Add "Controle Inibido" card to CB
    [Tags]      Cenário 15
        ${Cartao}           set Variable     CB-Cartoes-DefinirControleInibido.png
        ${ExcluirCartao}    set Variable     CB-Cartoes-ExcluirControleInibido.png
        log   "Definir Controle Inibido em um CB"
        When the CB is selected
        And clicked on CB-Cartoes
        And clicked on CB-Cartoes-Custom     ${Cartao}
        And filled the TAInformation card
        Then the card should be applied      ${ExcluirCartao}
    [Teardown]

Cenário 16: Verify "Controle Inibido" screen in "Cartões"
    [Tags]      Cenário 16
        ${Cartoes_Custom}   set Variable    Cartoes-ControleInibido.PNG
        ${Cartoes_Report}   set Variable    TesteControleInibido.PNG
        log     "Verificar tela Controle Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should contain the Custom card      ${Cartoes_Report}
        Close card window
    [Teardown]

Cenário 17: Delete "Controle Inibido" card from the CB
    [Tags]      Cenário 17
        ${Cartao}           set Variable     CB-Cartoes-DefinirControleInibido.png
        ${ExcluirCartao}    set Variable     CB-Cartoes-ExcluirControleInibido.png       
        log     "Exclui Controle Inibido em Cartões"
        When the CB is selected
        And clicked on CB-Cartoes
        And clicked on CB-Cartoes-ExcluirCustom      ${ExcluirCartao}  
        Then the card should be removed                     ${Cartao} 
    [Teardown]

Cenário 18: Verify "Controle Inibido" screen in "Cartões"
    [Tags]      Cenário 18
        ${Cartoes_Custom}   set Variable    Cartoes-ControleInibido.PNG
        ${Cartoes_Report}   set Variable    TesteControleInibido.PNG
        log     "Verificar tela Controle Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should not contain the Custom card      ${Cartoes_Report}
        Close card window
    [Teardown]

###########################################################################
# Cenário 19 - 22: Teste Alarme Inibido
###########################################################################

Cenário 19: Add "Alarme Inibido" card to CB
    [Tags]      Cenário 19
        ${Cartao}           set Variable     CB-Cartoes-DefinirAlarmeInibido.png
        ${ExcluirCartao}    set Variable     CB-Cartoes-ExcluirAlarmeInibido.png
        log   "Definir Alarme Inibido em um CB"
        When the CB is selected
        And clicked on CB-Cartoes
        And clicked on CB-Cartoes-Custom     ${Cartao}
        And filled the TAInformation card
        Then the card should be applied             ${ExcluirCartao}
    [Teardown]

Cenário 20: Verify "Alarme Inibido" screen in "Cartões"
    [Tags]      Cenário 20
        ${Cartoes_Custom}   set Variable    Cartoes-AlarmeInibido.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao.PNG
        log     "Verificar tela Alarme Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should contain the Custom card      ${Cartoes_Report}
        Close card window
    [Teardown]

Cenário 21: Delete "Alarme Inibido" card from the CB
    [Tags]      Cenário 21
        ${Cartao}           set Variable     CB-Cartoes-DefinirAlarmeInibido.png
        ${ExcluirCartao}    set Variable     CB-Cartoes-ExcluirAlarmeInibido.png
        log     "Exclui Alarme Inibido em Cartões"
        When the CB is selected
        And clicked on CB-Cartoes
        And clicked on CB-Cartoes-ExcluirCustom      ${ExcluirCartao}  
        Then the card should be removed                     ${Cartao} 
    [Teardown]

Cenário 22: Verify "Alarme Inibido" screen in "Cartões"
    [Tags]      Cenário 22
        ${Cartoes_Custom}   set Variable    Cartoes-AlarmeInibido.PNG
        ${Cartoes_Report}   set Variable    TesteRemovidoDeOperacao.PNG
        log     "Verificar tela Alarme Inibido em Cartões"
        Given that I'm in BaSiDi
        And clicked on Cartoes-Custom  ${Cartoes_Custom}
        Then the screen should not contain the Custom card      ${Cartoes_Report}
        Close card window
    [Teardown]

Cenário 23: Close Windows
    [Tags]      Cenário 23
        Close non-BaSiDi window
        Close non-BaSiDi window
    [Teardown]
