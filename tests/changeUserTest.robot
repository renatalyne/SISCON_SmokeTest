*** Settings ***

Resource          ${EXECDIR}\\resources\\bases\\changeUserBase.robot
Test Setup        Add Change Users Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***

Cenário 1: teste
    While logged into BasiDi
    Close All Windows
    Click on Trocar Usuário
    Fill in the data