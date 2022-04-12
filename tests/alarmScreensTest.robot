*** Settings ***

Resource          ${EXECDIR}/resources/bases/base.robot
Resource          ${EXECDIR}/resources/bases/alarmBase.robot
Test Setup        Add All Image Path

Test Teardown     Stop Remote Server

*** Test Cases ***

Cenário 01: Validação da Lista Geral
    [Tags]   Cenário 01
    Given that I'm in BaSiDi
    And Clicked on "Geral" in "Sumário de Alarmes"
    Then General Alarm List should be appeared
    [Teardown]

Cenário 02: Validação da Lista Disj - Proteção
    [Tags]   Cenário 02
    Given that I'm in BaSiDi
    And Clicked on "Disj - Proteção" in "Sumário de Alarmes"
    Then Disj - Proteção Alarm List should be appeared
    [Teardown]

Cenário 03: Validação da Lista Urgente
    [Tags]   Cenário 03
    Given that I'm in BaSiDi
    And Clicked on "Urgente" in "Sumário de Alarmes"
    Then Urgente Alarm List should be appeared
    [Teardown]

Cenário 04: Validação da Lista Automa-Bloq
    [Tags]   Cenário 04
        Given that I'm in BaSiDi
        And Clicked on "Automa - Bloq" in "Sumário de Alarmes"
        Then Automa - Bloq Alarm List should be appeared
    [Teardown]

Cenário 05: Validação da lista SH.Desc 
    [Tags]   Cenário 05
    Given that I'm in BaSiDi
    And Clicked on "SH.Desc" in "Sumário de Alarmes"
    Then SH.Desc Alarm List should be appeared
    [Teardown]

Cenário 06: Validação da lista Não Urgente
    [Tags]   Cenário 06
    Given that I'm in BaSiDi
    And Clicked on "Não Urgente" in "Sumário de Alarmes"
    Then Não Urgente Alarm List should be appeared
    [Teardown]

Cenário 07: Validação da lista Medidas
    [Tags]   Cenário 07
    Given that I'm in BaSiDi
    And Clicked on "Medidas" in "Sumário de Alarmes"
    Then Medidas Alarm List should be appeared
    [Teardown]

Cenário 08: Validação da lista Comunicação
    [Tags]   Cenário 08
    Given that I'm in BaSiDi
    And Clicked on "Comunicação" in "Sumário de Alarmes"
    Then Comunicação Alarm List should be appeared
    [Teardown]