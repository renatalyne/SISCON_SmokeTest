*** Settings ***
#TODO: Organizar nome dos testes.
#TODO: Organizar as TAGS.


Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Resource    ${EXECDIR}/resources/bases/base.robot
Library     ${EXECDIR}/resources/libraries/nova.py
Library           ${EXECDIR}\\resources\\libraries\\sshClient.py
Library           ${EXECDIR}\\resources\\libraries\\ssh.py


*** Variables ***
${ALARM_IMAGE_DIR}         ${EXECDIR}\\resources\\elements\\alarmes
${SPSY}                    /usr/bin/sudo su - spsy\n
${BAU}                     bau\n
${DISJ}                    ta /BVG/69/12Z3/DJ/Status\n
${ON}                      sta on tra\n
${OPEN}                    sta off tra\n
${MEDIDA}                  ta /BVG/13/01BP)1/Ua/MvMoment\n
${VAL12}                   val 12 tra\n
${TEST}                    touch teste\n


*** Keywords ***
Add Needed Alarm Image Path
    Add Image Path      ${ALARM_IMAGE_DIR}

Add All Image Path
    Add Needed Alarm Image Path
    Add Base Image Path

And Clicked on "Geral" in "Sumário de Alarmes"
    Click                               SA-Geral.png

Then General Alarm List should be appeared
    Wait Until Screen Contain           Geral.png        ${TEMPO}
    Right Click                         Geral.png
    Click                               fechar.png

And Clicked on "Disj - Proteção" in "Sumário de Alarmes"
    Click                               SA-Disj-Protecao.png

Then Disj - Proteção Alarm List should be appeared
    Wait Until Screen Contain           Disj-Protecao.png  ${TEMPO}
    Right Click                         Disj-Protecao.png
    Click                               fechar.png

And Clicked on "Urgente" in "Sumário de Alarmes"
    Click                               SA-Urgente.png

Then Urgente Alarm List should be appeared
    Wait Until Screen Contain           Urgente.png        ${TEMPO}
    Right Click                         Urgente.png
    Click                               fechar.png

And Clicked on "Automa - Bloq" in "Sumário de Alarmes"
    Click                               SA-Automa-Bloq.png

Then Automa - Bloq Alarm List should be appeared
    Wait Until Screen Contain           Automa-Bloq.png    ${TEMPO}
    Right Click                         Automa-Bloq.png
    Click                               fechar.png

And Clicked on "SH.Desc" in "Sumário de Alarmes"
    Click                               SA-SH.Desc.png

Then SH.Desc Alarm List should be appeared
    Wait Until Screen Contain           SH.Desc.png        ${TEMPO}
    Right Click                         SH.Desc.png
    Click                               fechar.png

And Clicked on "Não Urgente" in "Sumário de Alarmes"
    Click                               SA-NaoUrgente.png

Then Não Urgente Alarm List should be appeared
    Wait Until Screen Contain           NaoUrgente.png    ${TEMPO}
    Right Click                         NaoUrgente.png
    Click                               fechar.png

And Clicked on "Medidas" in "Sumário de Alarmes"
    Click                               SA-Medidas.png

Then Medidas Alarm List should be appeared
    Wait Until Screen Contain           Medidas.png        ${TEMPO}
    Right Click                         Medidas.png
    Click                               fechar.png

And Clicked on "Comunicação" in "Sumário de Alarmes"
    Click                               SA-Comunicacao.png

Then Comunicação Alarm List should be appeared
    Wait Until Screen Contain           Comunicacao.png    ${TEMPO}
    Right Click                         Comunicacao.png
    Click                               fechar.png

Then Disj - Protecao Alarm is created
    # Exec Command                        ${SPSY}
    # Sleep   3
    # Exec Command                        ${BAU}
    # Sleep   3
    # Exec Command                        ${DISJ}
    # Sleep   3
    # Exec Command                        ${ON}
    # Sleep   3
    # Exec Command                        ${OPEN}
    # Disconnect
    #Send Command
    Exec Command                         ${TEST}
    Disconnect 

Then I confirm Disj in General and Disj Alarmes
    Click                               SA-Geral.png
    Wait Until Screen Contain           created-disj.png     ${TEMPO}
    Right Click                         Geral.png
    Click                               fechar.png
    Click                               SA-Disj-Protecao.png
    Wait Until Screen Contain           created-disj.png     ${TEMPO}
    Right Click                         Disj-Protecao.png
    Click                               fechar.png



