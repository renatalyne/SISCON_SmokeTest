*** Settings ***

Resource          ${EXECDIR}/resources/bases/usersBase.robot
Test Setup        Add Users Image Path

Test Teardown     Stop Remote Server


*** Test Cases ***

#Given
#And
#When
#Then

#Cenário 1 - 8: Realiza o processo de criar um novo usuário do SP7

Cenário 1: Abrir tela Usuário em Sistemas
    [Tags]      Cenário 1
        log     "Abrir tela Usuário em Sistemas"
        Given that I'm in BaSiDi
        And clicked on "Sistemas" 
        And clicked on "Usuários"
        Then the Users Management should appeared
    [Teardown]

Cenário 2: Ir até a tela de propriedades de Usuário 
    [Tags]   Cenário 2
        log     "Ir até a tela de propriedades de Usuário"
        When "Propriedades do usuário" is clicked
        Then the Users Proprieties should appeared

    [Teardown]

Cenário 3: Clicar em criar novo usuário
    [Tags]  Cenário 3
        log     "Clicar em criar novo usuário"
        And clicked on "Criar novo Usuário"
        Then the create new user should appeared
    [Teardown]

Cenário 4: Verificar Mensagem de Erro 1
    [Tags]  Cenário 4
        log     "Verificar Mensagem de Erro 1"   
        And try to create user
        Then the invalid user message should appeared
    [Teardown]

Cenário 5: Verificar Mensagem de Erro 2
    [Tags]   Cenário 5
        log     "Verificar Mensagem de Erro 2" 
        And fill the login and password field
        And try to create user
        Then the invalid authority message should appeared
    [Teardown]

Cenário 6: Verificar Mensagem de Erro 3
    [Tags]   Cenário 6
        log     "Verificar Mensagem de Erro 3" 
        And fill the authority field
        And try to create user
        Then the invalid function message should appeared
    [Teardown]

Cenário 7: Verificar Mensagem de Erro 4
    [Tags]   Cenário 7
        log     "Verificar Mensagem de Erro 4"
        And fill the function field
        And try to create user
        Then the invalid class message should appeared
    [Teardown]

Cenário 8: Criar novo usuário com sucesso
    [Tags]   Cenário 8
        log     "Criar novo usuário com sucesso"
        And fill the class field
        And try to create user
        Then the successful new user creation message appeared 
        Close Users Proprieties
    [Teardown]