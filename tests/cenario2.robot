*** Settings ***

Resource          ${EXECDIR}/resources/base.robot
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***
Cenário 2 : Validar criação de fussy outages

  Dado que estou logado no sistema
  E estou na aba "DISTRIBUIÇÃO"
  Quando gero um nova "CHAMADA"
  E preenche estado
#Então
  E Fecha página Chamadas







  
