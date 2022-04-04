*** Settings ***

Resource          ${EXECDIR}/resources/bases/base.robot
Resource          ${EXECDIR}/resources/bases/alarmBase.robot
Test Setup        Add All Image Path

Test Teardown     Stop Remote Server

*** Test Cases ***