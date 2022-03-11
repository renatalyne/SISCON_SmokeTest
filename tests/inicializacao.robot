*** Settings ***

Resource          ${EXECDIR}/resources/base.robot
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***

Cenário 7.5: Gerar Equipe
  [Tags]    Smoke Dado que estou logado no sistema
    E estou na aba "DISTRIBUIÇÃO"
    E estou na tela "Equipes"
    Selecionar Equipe
    Iniciar Turno de Equipe 
  [Teardown]

