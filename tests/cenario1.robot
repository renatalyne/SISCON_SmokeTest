*** Settings ***

Resource          ${EXECDIR}/resources/base.robot
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server


*** Test Cases ***


Cenário 1 : Validar criação de outages por Tcall
    [Tags]   Teste1
       log  Objetivo do teste é criar uma nova ocorrência por chamada de cliente morador
       Dado que estou logado no sistema
       E estou na aba "DISTRIBUIÇÃO"
       Quando gero um nova "CHAMADA"
       E busca cliente
       E preenche estado
       Então aparece a nova CHAMADA no grid
       E valida tipo de ocorrência diferente de "Ocorrência indefinida"
       E Fecha página Chamadas detalhes
       E realiza pesquisa na listagem
       E Fecha página de listagem de chamadas

     [Teardown]

Cenário 2 : Validar fuzzy outage
      [Tags]   Teste2
  log  Objetivo do teste é criar uma nova ocorrência por chamada de cliente não morador
          Dado que estou logado no sistema
          E estou na aba "DISTRIBUIÇÃO"
           Quando gero um nova "CHAMADA"
           E preenche estado
           Então aparece a nova CHAMADA no grid
           E valida tipo de ocorrência igual a "Ocorrência indefinida"
           E Fecha página Chamadas detalhes
           E realiza pesquisa na listagem
           E Fecha página de listagem de chamadas
         [Teardown]

Cenário 3: Validar criação outage com abertura manual de chave
     [Tags]   Teste3

      log  Objetivo deste teste é validar abertura manual de chave e a criaçaõ de ocorrência na tabela 
      Dado que estou logado no sistema
      E estou na tela "Lista de Telas"
      Minimiza sp7
      Quando realizo a pesquisa
      E clico em chamar
      E abro chave escolhida
      Então a ocorrência é gerada
      E fecha "histórico de ocorrência"
      E fecha chave aberta
      E fecha tela "Processo/TempoReal"
      E fecha tela "TA nomes"
      E abre sp7 escuro

    [Teardown]

Cenario 4 : Criar Outage planejado
  
  [Tags]   Teste4

  log   Objetivo do teste é criar uma ocorrência planejada

  Dado que estou logado no sistema
  E estou na aba "DISTRIBUIÇÃO"
  E Estou na tela "Ocorrências"
  Minimiza sp7
  E estou na aba "Ocorrências Planejadas"
  Quando gero uma nova ocorrência Planejadas
  E preencho "Tipo Serviço"
  E clico em "Salvar"
  Então gera uma nova ocorrência planejada
  E fecha "trabalho planejado"
  E fecha "gerenciamento de ocorrências"
  Sleep   5 
  E abre sp7 escuro

      [Teardown]

Cenário 5: Criar Outage pelo Bau
   
   [Tags]   Teste5

   log   Objetivo deste teste é criar uma ocorrência utilizando o simulador bau, não funciona em sistema distribuido.

  Dado que estou logado no sistema
  E estou na aba "DISTRIBUIÇÃO"
  E verifico as ocorrências emergenciais 
  Quando gero a ocorrência via bau
  E abre sp7 escuro
  E verifico as ocorrências emergenciais após ocorrência
  Então uma nova ocorrência é gerado no relatório
  E fecha "gerenciamento de ocorrências"
  E abre sp7 escuro

        [Teardown]

Cenário 6: Validar criação de Tarefa

   [Tags]   Teste6

  Dado que estou logado no sistema
  E estou na aba "DISTRIBUIÇÃO"
  E Estou na tela "Ocorrências"
  Minimiza sp7
  E estou na aba "Ocorrências Emergênciais"
  E seleciono ocorrência
  Quando crio uma nova tarefa
  

    [Teardown]

Cenário 7: Completar o fluxo da tarefa


   [Tags]    Teste7

  Quando associo uma equipe disponivel 
  E evoluo os status da tarefa 
  Então as datas de realizado são preechida 
  E fecha detalhes da tarefa
  Então tarefa é apresentada no grid de tarefas
  E fecha tarefas 
  E fecha "gerenciamento de ocorrências"
  E abre sp7 escuro
    

   [Teardown]

Cenário 8: Editar alguma info do outage;
   [Tags]    Teste8

  #Dado que estou na tela de detalhes da ocorrência
  E seleciono ocorrência condicional
  Quando preencho os dados básicos 
  E clico em "Salvar" condicional 
  Então aparece a mensagem salvo com sucesso 



Cenário 9: Completar o fluxo do outage;
    [Tags]    Teste9
  
    E abre sp7 escuro
    E Estou na tela "Ocorrências"
    Minimiza sp7
    E estou na aba "Ocorrências Emergênciais"
    Completar Ocorrencia

    #Dado que estou na tela de detalhes da ocorrência

Cenário 10: Arquivar Outage
    [Tags]    Teste10
    Arquivar Ocorrencia
    E fecha "gerenciamento de ocorrências"
    E Verifico Historico de ocorrencias

  
