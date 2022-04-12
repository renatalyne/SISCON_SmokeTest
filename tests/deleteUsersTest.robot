*** Settings ***

Resource          ${EXECDIR}/resources/bases/usersBase.robot
Test Setup        Add Users Image Path

Test Teardown     Stop Remote Server


*** Test Cases ***
###########################################################################
#Cenário 1 - 3: Realiza o processo de deletar um usuário do SP7 (Normlamente TesteQA)
###########################################################################
Cenário 01: Abrir tela Usuário em Sistemas
    [Tags]      Cenário 01
        log     "Abrir tela Usuário em Sistemas"
        Given that I'm in BaSiDi
        And Clicked on "Sistemas" 
        And Clicked on "Usuários"
        Then the Users Management should appeared
    [Teardown]

Cenário 02: Ir até a tela de propriedades de Usuário 
    [Tags]   Cenário 02
        log     "Ir até a tela de propriedades de Usuário"
        When "Propriedades do usuário" is clicked
        Then the Users Proprieties should appeared

    [Teardown]

Cenário 03: Deletar Usuário
    [Tags]     Cenário 03
        ${Usuario_Teste}     set Variable    UsuarioTeste.PNG
        log     "Deleta usuário criado"
        When user test is selected          ${Usuario_Teste}
        And the delete button is clicked
        Then user this should desapear 
        Close Users Proprieties
    [Teardown]

