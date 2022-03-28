*** Settings ***

Resource          ${EXECDIR}\\resources\\bases\\changeUsersBase.robot
Test Setup        Add Change Users Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***

Cenário 1: Trocar Usuário Falha
    [Tags]   Teste1
        ${Login}        set Variable    teste
        ${Password}     set Variable    teste
        While logged into BasiDi
        Close All Windows
        Click on Trocar Usuário
        Fill in the data    ${Login}     ${Password}
        Expected Error
        Close BasiDi
        Open BaSiDi         ${Login}     ${Password}
    [Teardown]

Cenário 2: Trocar Usuário sucesso
    [Tags]   Teste2
        ${Login}        set Variable    spectrum
        ${Password}     set Variable    spectrum
        While logged into BasiDi
        Close All Windows
        Click on Trocar Usuário
        Fill in the data    ${Login}     ${Password}
        Expected Sucess
    [Teardown]