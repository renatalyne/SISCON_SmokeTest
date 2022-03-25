*** Settings ***

Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
Resource    ${EXEC_DIR}/resources/base.robot
Library     ${EXECDIR}/resources/libraries/nova.py


*** Variables ***

${IMAGE_DIR}       ${EXECDIR}\\resources\\elements
${PATH}            C:\\Program Files\\Siemens\\SpectrumPower7\\odvlauncher
${EXEC_SPECTRUM}   odvlauncher.exe -admin
${TEMPLATE_DIR}    C:\\temp\\template.txt
${TEMPO}           10
${SLEEP}           40
${TIPO2}           Ocorrência indefinida
${MAQUINA}         dvl81ibd
${LOGIN}           psene
${PASSWORD}        jS4BvgnjmCXtgnTs
${present}         Run Keyword and Return Status    Screen Should Contain    sp7-close-symbol.png


${TACOMANDO}               ta/US-S3/13/Bay7/CB/Status
${TA}                      US-S3/13/Bay7


*** Keywords ***


Conferir mudança de usuario novo
    Click   sp7-TrocarUsuario.PNG
