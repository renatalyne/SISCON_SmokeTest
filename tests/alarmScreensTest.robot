*** Settings ***

Resource          ${EXECDIR}/resources/bases/base.robot
Resource          ${EXECDIR}/resources/bases/alarmBase.robot
Test Setup        Add All Image Path

Test Teardown     Stop Remote Server

*** Test Cases ***

Cenário 1: Validação da Lista Geral
    Dado que estou logado no sistema
    And Clicked on "Geral" in "Sumário de Alarmes"
    Then General Alarm List should be appeared
    [Teardown]

Cenário 2: Validação da Lista Disj - Proteção
    Dado que estou logado no sistema
    And Clicked on "Disj - Proteção" in "Sumário de Alarmes"
    Then Disj - Proteção Alarm List should be appeared
    [Teardown]

Cenário 3: Validação da Lista Urgente
    Dado que estou logado no sistema
    And Clicked on "Urgente" in "Sumário de Alarmes"
    Then Urgente Alarm List should be appeared
    [Teardown]

Cenário 4: Validação da Lista Automa-Bloq
        Dado que estou logado no sistema
        And Clicked on "Automa - Bloq" in "Sumário de Alarmes"
        Then Automa - Bloq Alarm List should be appeared
    [Teardown]

Cenário 5: Validação da lista SH.Desc 
    Dado que estou logado no sistema
    And Clicked on "SH.Desc" in "Sumário de Alarmes"
    Then SH.Desc Alarm List should be appeared
    [Teardown]

Cenário 6: Validação da lista Não Urgente
    Dado que estou logado no sistema
    And Clicked on "Não Urgente" in "Sumário de Alarmes"
    Then Não Urgente Alarm List should be appeared
    [Teardown]

Cenário 7: Validação da lista Medidas
    Dado que estou logado no sistema
    And Clicked on "Medidas" in "Sumário de Alarmes"
    Then Medidas Alarm List should be appeared
    [Teardown]

Cenário 8: Validação da lista Comunicação
    [Tags]   teste1
    Dado que estou logado no sistema
    And Clicked on "Comunicação" in "Sumário de Alarmes"
    Then Comunicação Alarm List should be appeared
    [Teardown]