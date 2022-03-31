*** Settings ***

Resource          ${EXECDIR}\\resources\\bases\\changeUsersBase.robot
Test Setup        Add Change Users Image Path
Test Teardown     Stop Remote Server

*** Test Cases ***

Cenário 1: Abrir tela de Troca Usuário
    [Tags]   Cenário 1
        log     "Abrir tela de Troca Usuário"
        Given that I'm in BaSiDi
        And Click on "Trocar Usuário"
        Then the change user windows should appeared
    [Teardown]

Cenário 2: Fill in the data
    [Tags]      Cenário 2
        log     "Preenche formulário de troca de usuário"
        ${Login}        set Variable    teste
        ${Password}     set Variable    teste
        When the data is filled     ${Login}     ${Password}
        Then an expected error should appeared
    [Teardown]

Cenário 3: Close BaSiDi
    [Tags]      Cenário 3
        log     "Fechar BaSiDi"
        And try to close BasiDi
        Then BasiDi should be closed sucessfully
    [Teardown]

Cenário 4: Reopen BaSiDi
    [Tags]      Cenário 4
        log      "Reabre o BaSiDi"
        When BaSiDi Login screen is reopened
        Then an security message should appeared

    [Teardown]

Cenário 5: Try Login in BaSiDi
    [Tags]      Cenário 5
        log     "Preenche login e senha"
        ${Login}        set Variable    teste
        ${Password}     set Variable    teste        
        log     "Tenta Logar no BaSiDi"
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then an expered password message should appeared

    [Teardown]

Cenário 6: New password failure
    [Tags]      Cenário 6
        log     "Falha em gerar uma nova senha"
        ${Password}     set Variable    teste 
        When the BaSiDi new password field is filled      ${Password}
        Then and short password message should appeared

    [Teardown]

Cenário 7: Try Login in BaSiDi
    [Tags]      Cenário 7
        log     "Preenche login e senha"
        ${Login}        set Variable    teste
        ${Password}     set Variable    teste        
        log     "Tenta Logar no BaSiDi"
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then an expered password message should appeared

    [Teardown]

Cenário 8: New password failure 2
    [Tags]      Cenário 8
        log     "Falha em gerar uma nova senha 2"
        ${Password}     set Variable    testeteste
        When the BaSiDi new password field is filled      ${Password}
        Then and no numeric in password message should appeared

    [Teardown]

Cenário 9: Try Login in BaSiDi
    [Tags]      Cenário 9
        log     "Preenche login e senha"
        ${Login}        set Variable    teste
        ${Password}     set Variable    teste        
        log     "Tenta Logar no BaSiDi"
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then an expered password message should appeared

    [Teardown]

Cenário 10: New password failure 3
    [Tags]      Cenário 10
        log     "Sucesso em gerar uma nova senha"
        ${Password}     set Variable    testeteste
        When the BaSiDi new password field is filled      ${Password}
        Then and no numeric in password message should appeared

    [Teardown]

Cenário 11: Try Login in BaSiDi
    [Tags]      Cenário 11
        log     "Preenche login e senha"
        ${Login}        set Variable    teste
        ${Password}     set Variable    teste        
        log     "Tenta Logar no BaSiDi"
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then an expered password message should appeared

    [Teardown]

Cenário 12: New password sucess
    [Tags]      Cenário 12
        log     "Sucesso em gerar uma nova senha"
        ${Password}     set Variable    teste123
        When the BaSiDi new password field is filled      ${Password}
        #Then and no numeric in password message should appeared
        Then the sucesfull login message should appeared

    [Teardown]

Cenário 13: Abrir tela de Troca Usuário
    [Tags]      Cenário 13
        log     "Abrir tela de Troca Usuário"
        Given that I'm in BaSiDi
        And Click on "Trocar Usuário"
        Then the change user windows should appeared
    [Teardown]

Cenário 14: Fill in the data
    [Tags]      Cenário 14
        log     "Preenche formulário de troca de usuário"
        ${Login}        set Variable    spectrum
        ${Password}     set Variable    spectrum
        When the data is filled    ${Login}     ${Password}
        Then an sucessfull message should appeared

    [Teardown]
