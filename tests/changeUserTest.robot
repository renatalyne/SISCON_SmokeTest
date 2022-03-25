*** Settings ***

Resource          ${EXECDIR}/resources/base.robot
Resource          ${EXECDIR}/resources/changeUserBase.robot
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server

*** Test Cases ***

Cenário 1: Trocar de usuário
        log     trocar usuário criado
        Dado que estou logado no sistema
        Clicar em trocar usuário 
