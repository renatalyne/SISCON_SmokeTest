*** Settings ***

Resource          ${EXECDIR}/resources/base.robot
Resource          ${EXECDIR}/resources/usersBase.robot
Test Setup        Add All Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***

Cenário 1 : Validar Criação de novo usuário
    [Tags]      ""
        log     "Este teste tem como objetivo validar a criação de usuário"
        Dado que estou logado no sistema
        Go to Users Management