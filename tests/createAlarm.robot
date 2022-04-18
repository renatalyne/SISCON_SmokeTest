*** Settings ***

Resource          ${EXECDIR}/resources/bases/base.robot
Resource          ${EXECDIR}/resources/bases/alarmBase.robot
Library           ${EXECDIR}\\resources\\libraries\\sshClient.py
Test Setup        Add All Image Path
Test Teardown     Stop Remote Server

*** Variables ***

${DISJ}                    ta /BVG/69/12Z3/DJ/Status\n
${ON}                      sta on tra\n
${OPEN}                    sta off tra\n
${MEDIDA}                  ta /BVG/13/01BP)1/Ua/MvMoment\n
${VAL12}                   val 12 tra\n


*** Test Cases ***

Cenário 1: Criar Alarme de Disjuntor de proteção
    Then Disj - Protecao Alarm is created
    Then I confirm Disj in General and Disj Alarmes
    [Teardown]

# Cenário 2: Criar Alarme de Medida