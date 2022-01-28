*** Settings ***

Resource          ${EXECDIR}/resources/base.robot
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***

Inicializando o cmd
  Abre a pesquisa
  Digita pesquisa
  Conecta no SpectrumPower7
  Realiza login
  Log    finalizou a conexão
