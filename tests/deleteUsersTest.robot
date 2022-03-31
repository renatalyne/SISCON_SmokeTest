*** Settings ***

Resource          ${EXECDIR}/resources/bases/usersBase.robot
Test Setup        Add Users Image Path

Test Teardown     Stop Remote Server


*** Test Cases ***

Cenário 1: Abrir tela Usuário em Sistemas
    [Tags]      Cenário 1
        log     "Abrir tela Usuário em Sistemas"
        Given that I'm in BaSiDi
        And Clicked on "Sistemas" 
        And Clicked on "Usuários"
        Then the Users Management should appeared
    [Teardown]

Cenário 2: Ir até a tela de propriedades de Usuário 
    [Tags]   Cenário 2
        log     "Ir até a tela de propriedades de Usuário"
        When "Propriedades do usuário" is clicked
        Then the Users Proprieties should appeared

    [Teardown]

Cenário 3: Deletar Usuário
    [Tags]     Cenário 3
        log     "Deleta usuário criado"
        When user test is selected
        And the delete button is clicked
        Then user this should desapear 
        Close Users Proprieties

    [Teardown]

