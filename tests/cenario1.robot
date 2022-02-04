*** Settings ***

Resource          ${EXECDIR}/resources/base.robot
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***


# Cenário 1 : Validar criação de outages por Tcall
#     [Tags]   Smoke
#
#       Dado que estou logado no sistema
#       E estou na aba "DISTRIBUIÇÃO"
#       Quando gero um nova "CHAMADA"
#       E busca cliente
#       E preenche estado
#       Então aparece a nova CHAMADA no grid
#       E valida tipo de ocorrência diferente de "Ocorrência indefinida"
#       E Fecha página Chamadas detalhes
#       E realiza pesquisa na listagem
#       E Fecha página de listagem de chamadas
#
#     [Teardown]

#
# Cenário 2 : Validar fuzzy outage
#         [Tags]   Smoke
#
#           Dado que estou logado no sistema
#           E estou na aba "DISTRIBUIÇÃO"
#           Quando gero um nova "CHAMADA"
#           E preenche estado
#           Então aparece a nova CHAMADA no grid
#           E valida tipo de ocorrência igual a "Ocorrência indefinida"
#           E Fecha página Chamadas detalhes
#           E realiza pesquisa na listagem
#           E Fecha página de listagem de chamadas
#
#         [Teardown]

Cenário 3: Validar criação outage com abertura manual de chave
      [Tags]   Smoke

      Dado que estou logado no sistema
      E estou na tela "Lista de Telas"
      Minimiza sp7
      Quando realizo a pesquisa
      E clico em chamar
      E abro chave escolhida
      # Então a ocorrência é gerada
        [Teardown]
