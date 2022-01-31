*** Settings ***

Resource          ${EXECDIR}/resources/base.robot
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***


Cenário 1 : Validar criação de outages por Tcall
    [Tags]   Smoke
      Dado que estou logado no sistema
      E estou na aba "DISTRIBUIÇÃO"
      Quando gero um nova "CHAMADA"
      E busca cliente
      E preenche estado
  #    Então aparece a nova CHAMADA no grid
      E Fecha página Chamadas

    [Teardown]

Cenário 2 : Validar criação de fussy outages
    [Tags]   Smoke

      Dado que estou logado no sistema
      E estou na aba "DISTRIBUIÇÃO"
      Quando gero um nova "CHAMADA"
      E preenche estado
    #Então falta completar o resultado esperado
      E Fecha página Chamadas

    [Teardown]
