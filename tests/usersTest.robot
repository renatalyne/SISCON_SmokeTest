*** Settings ***

Resource          ${EXECDIR}/resources/bases/usersBase.robot
Test Setup        Add Users Image Path

Test Teardown     Stop Remote Server


*** Test Cases ***

Cenário 1 : Validar Criação de novo usuário
    [Tags]      ""
        log     "Este teste tem como objetivo validar a criação de usuário"
        While logged into BasiDi
        Go to Users Management
        Empty User
        Empty Details
        Close Users Proprieties
