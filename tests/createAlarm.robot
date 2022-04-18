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
${Environment}             dvl
${Host}                    dvl81ibd
${Username}                psene
${Password}                jS4BvgnjmCXtgnTs



*** Test Cases ***

Cenário 00: Setup
    [Tags]      Cenário 00
        IF      "${Environment}" == "dvl"     

            set Global Variable      ${Host}                    dvl81ibd
            set Global Variable      ${Username}                psene
            set Global Variable      ${Password}                jS4BvgnjmCXtgnTs

        END   
        IF      "${Environment}" == "admmst"     
            
            set Global Variable      ${Host}                    admmtst
            set Global Variable      ${Username}                spsy
            set Global Variable      ${Password}                Iberdrola1!


        END


        Close all non-BaSiDi windows
    [Teardown]

Cenário 1: Criar Alarme de Disjuntor de proteção
    Then Disj - Protecao Alarm is created       ${Host}     ${Username}     ${Password}
    Then I confirm Disj in General and Disj Alarmes
    [Teardown]

# Cenário 2: Criar Alarme de Medida