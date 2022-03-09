*** Settings ***

Library     SikuliLibrary
Library     OperatingSystem
Library     ScreenCapLibrary
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


Add Needed Image Path
    Add Image Path         ${IMAGE_DIR}

Abre a pesquisa
    Click    lupa-windows.png


Minimiza sp7
    Right Click                  titulo.png
    click                         minimizar.png

Digita pesquisa
    Input Text                    pesquisa-windows.png     cmd
    Wait Until Screen Contain     cmd-icone.png                               ${TEMPO}
    Click                         cmd-icone.png
    Paste Text                    cursor-cmd.png   cd ${PATH}
    Press Special Key             ENTER
    Paste Text                    cursor-cmd.png   ${EXEC_SPECTRUM}
    Press Special Key             ENTER


Conecta no SpectrumPower7
    Click                           81ibd.png
    Click                           conectar-spectrum.png
    Wait Until Screen Contain       info-seguranca.png                        ${TEMPO}
    Screen Should Contain           info-seguranca.png
    Click                           ok-info-seguranca.png

Realiza login
    Screen Should Contain           login-81ibd.sps.png
    Input Text                      login-nomeUsuario.png    spectrum
    Input Text                      login-senha.png          spectrum
    Click                           login-botaoLogin.png
    Wait Until Screen Contain       spectrum-logo.png                         ${TEMPO}
    Screen Should Contain           spectrum-conectado.png
    Capture Screen

Dado que estou logado no sistema
    Screen Should Contain            spectrum-conectado.png

E estou na aba "DISTRIBUIÇÃO"

  ${imageCoordinates}=    Get Image Coordinates          spectrum-distribuição.png
  Click Region            ${imageCoordinates}
  Wait Until Screen Contain        spectrum-distribuição-interno.png          ${TEMPO}
  Screen Should Contain            spectrum-distribuição-chamada.png

Quando gero um nova "CHAMADA"
    Click                        spectrum-distribuição-chamada.png
    Right Click                  titulo.png
    click                         minimizar.png
    Wait Until Screen Contain    sp7-dist-chamada-titulo.png                  ${TEMPO}
    Click                        sp7-dist-chamada-novo.png
    Wait Until Screen Contain    sp7-dist-chamada-nova-detalhes.png           ${TEMPO}
    Wait Until Screen Contain    sp7-dist-chamada-nova-dadosReclamante.png    ${TEMPO}
    Click                        sp7-dist-chamada-nova-tipo.png
    Click                        sp7-dist-chamada-nova-tipo-1.png
    Click                        maximiza.png
    Input Text                   sp7-dist-chamada-nova-obs.png    Automacao
E busca cliente
    Click                        sp7-dist-chamada-nova-dadosReclamante-buscar.png
    Click                        sp7-dist-chamada-nova-dados-buscar-buscar.png
    Wait Until Screen Contain    sp7-dadosReclamante-buscar-buscar-ultimachamada.png      ${TEMPO}
    Click                        sp7-dadosReclamante-buscar-buscar-ultimachamada.png
    Sleep   1
    Wait Until Screen Contain    sp7-dadosReclamante-buscar-buscar-ultimachamada2.png     ${TEMPO}
    Click                        sp7-dadosReclamante-buscar-buscar-ultimachamada2.png
    SLeep   1
    Wait Until Screen Contain    sp7-dadosReclamante-buscar-buscar-ultimachamada3.png     ${TEMPO}
    Click                        sp7-dadosReclamante-buscar-buscar-copiar.png
    Sleep   2
    Wait Until Screen Contain    sp7-chamada-interno.png                                  ${TEMPO}
E preenche estado
    ${imageCoordinates}=	       Get Image Coordinates	sp7-dist-chamada-dados-estado.png=0.65
    Click Region                 ${imageCoordinates}
    Click                        sp7-dist-chamada-dados-estado-pernambuco
    Wait Until Screen Not Contain    sp7-dist-chamada-dados-cidadevazia                   ${TEMPO}
    ${score} =	Get Match Score                  sp7-dist-chamada-nova-salvar2.png
    ${imageCoordinates}=	       Get Image Coordinates	sp7-dist-chamada-nova-salvar2.png=0.75
    Click Region                 ${imageCoordinates}

E Fecha página Chamadas detalhes
    Right Click                   sp7-dist-chamada-titulo-detalhesdachamada.png
    Click                         fechar.png

E Fecha página de listagem de chamadas

    Right Click                   sp7-dist-chamada-titulo-listagem.png
    Click                         fechar.png
    ${score} =                    Get Match Score         sp7-icone-escuro.png
    Log to console      ${score}
    Run Keyword if                ${score} > 0.95         E abre sp7 escuro      ELSE    E abre sp7

Então aparece a nova CHAMADA no grid
    Wait Until Screen Contain    sp7-chamada-result-tipo.png    ${TEMPO}
    Screen Should Contain    sp7-chamada-result-titulo.png
    Wait Until Screen Contain   sp7-chamada-result-idOcorrencia.png    100  
   # Sleep    ${SLEEP}
    Right Click    sp7-chamada-result-tipo.png
    Click    copiar.png

E valida tipo de ocorrência diferente de "Ocorrência indefinida"
    ${TIPO_OCOR} =	  Get Text From Clipboard
    Right Click       sp7-chamada-result-idOcorrencia.png
    Click             copiar.png
    ${ID_OCOR} =	   Get Text From Clipboard
    Should Not Be Empty    ${TIPO_OCOR}
    Should Not Be Equal As Strings    ${TIPO_OCOR}    ${TIPO2}


E valida tipo de ocorrência igual a "Ocorrência indefinida"

    ${TIPO_OCOR} =	  Get Text From Clipboard
    Right Click       sp7-chamada-result-idOcorrencia.png
    Click             copiar.png
    ${ID_OCOR} =	   Get Text From Clipboard
    Should Not Be Empty    ${TIPO_OCOR}
    Should Be Equal As Strings    ${TIPO_OCOR}    ${TIPO2}

E realiza pesquisa na listagem
    Click      sp7-chamada-listagem-idOcorr.png
    Type With Modifiers    v    CTRL
    Press Special Key    ENTER
    Screen Should Contain    sp7-chamada-listagem-interno.png

E estou na tela "Lista de Telas"
  Click    sp7-listaTelas.png



Quando realizo a pesquisa
  Input Text    sp7-listaTelas-NomeB2.png     13TRF
  Press Special Key    TAB
  Paste Text   sp7-listaTelas-NomeB3.png      C00704
  Press Special Key    ENTER
  Sleep             1


E clico em chamar
  Click    sp7-listaTelas-chamar.png
  Sleep    3

E abro chave escolhida
  Right Click    sp7-listaTelas-chamar-simboloVerde.png
  Click         sp7-listaTelas-chamar-simboloVerde-gerOcorrencia.png
  Click         sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-hist.png
  Sleep         5
  Wait Until Screen Contain     sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-idOcorr-name.png    100 
  Set Screenshot Directory      ${IMAGE_DIR}
  Take Partial Screenshot	    sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-idOcorr.png    none    none    912	     450    100    400      true   800px   1
  ${TEXTO} =   Get Text         sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-idOcorr.png	
  Set Global Variable     ${TEXTO}
  Right Click    sp7-listaTelas-gerenciamento-historico-titulo.png
  Click    fechar.png
  Right Click    sp7-listaTelas-chamar-simboloVerde.png
  Click          sp7-listaTelas-chamar-simboloVerde-abrir.png
  Input Text     sp7-listaTelas-chamar-simboloVerde-abrir-cometario.png    Automacao
  Click          sp7-listaTelas-chamar-simboloVerde-abrir-executar.png
  Sleep       1


Então a ocorrência é gerada
  Right Click    sp7-listaTelas-chamar-simboloVerde.png
  Click         sp7-listaTelas-chamar-simboloVerde-gerOcorrencia.png
  Click         sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-hist.png
  Sleep         10
  Set Screenshot Directory      ${IMAGE_DIR}
  Take Partial Screenshot	   sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-idOcorr2.png    none    none    912	     450    100    400      true   800px   1
  Sleep         5
  ${TEXTO 2} =   Get Text         sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-idOcorr2.png
  Should Not Be Equal As Strings    ${TEXTO}    ${TEXTO2}


E Estou na tela "Ocorrências"
    Click                       sp7-dist-ocorrencias-botao.png
    Wait Until Screen Contain   sp7-dist-ocorrencias-abas.png    100


E estou na aba "Ocorrências Planejadas"    
    Click                       sp7-dist-ocorrencias-aba-ocorrenciaPlanejada.png
    Sleep                       10

Quando gero uma nova ocorrência Planejadas 
    Click                       botãoLiberarListagem.png
    Wait Until Screen Not Contain   carregando.png      100
    Click                       sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-botaoNovo.png
    Wait Until Screen Contain   sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-titulo.png     ${SLEEP}
    Right Click                 sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-titulo.png
    Click                       maximiza.png
    Sleep                       1
E preencho "Tipo Serviço"
    Click                       sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-tipoServiço.png
    Click                       sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-tipoServiço-manutencao.png

E clico em "Salvar"
    Click                       sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-salvar.png 

Então gera uma nova ocorrência planejada
    
     Wait Until Screen Contain   sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-resultado.png      100
     Screen Should Contain       sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-resultado.png

E fecha "trabalho planejado"
    Right Click         sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-titulo.png
    Click               fechar.png   

E fecha "gerenciamento de ocorrências"
  Right Click   sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-gerOcorrencia-titulo.png
  Click          fechar.png       

E abre sp7
    Click                         sp7-icone.png

E abre sp7 escuro
    Click                       sp7-icone-escuro.png

E fecha tela "Processo/TempoReal"
    Right Click       sp7-listaTelas-chamar-titulo.png
    Click             fechar.png

E fecha tela "TA nomes"
    Right Click   sp7-listaTelas-titulo.png
    Click          fechar.png

E fecha "histórico de ocorrência"
    Right Click   sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-titulo.png
    Click         fechar.png

E fecha chave aberta
    Sleep           5
    Right Click    sp7-listaTelas-chamar-simboloVerde.png
    Click          sp7-listaTelas-chamar-simboloVerde-abrir.png
    Input Text     sp7-listaTelas-chamar-simboloVerde-abrir-cometario.png    Automacao
    Click          sp7-listaTelas-chamar-simboloVerde-abrir-executar.png
    Sleep       1

Abrir putty
    Type With Modifiers            r              WIN
    Press Special Key              DELETE
    Input Text                    windows-r.png     putty
    Press Special Key              ENTER
    Wait Until Screen Contain      putty-interno.png          10
    Input Text                     putty-hostName.png        ${MAQUINA}
    Click                          putty-open.png
    Input Text                     login.png                  ${LOGIN} 
    Press Special Key              ENTER
    Input Text                     putty-password.png         ${PASSWORD} 
    Press Special Key              ENTER
    


Abrir comando
    Type With Modifiers            r              WIN
    Press Special Key              DELETE
    Input Text                     windows-r.png     ${TACOMANDO} 
    Type With Modifiers             a           CTRL     
    Type With Modifiers             c           CTRL


Quando gero a ocorrência via bau

    Abrir comando
    Abrir putty
    Wait Until Screen Contain       putty-login-interno.png             100
    Input Text                      putty-comando.png           sudo su - spsy
    Press Special Key               ENTER
    Input Text                      putty-comando.png                   bau
    Press Special Key               ENTER
    Right Click                     putty-comando-ta.png
    Press Special Key               ENTER 
    Input Text                      putty-comando-ta.png                sta off tra
    Press Special Key               ENTER
    Sleep                           5
    Input Text                      putty-comando-ta.png                sta on tra
    Press Special Key               ENTER
E verifico as ocorrências emergenciais 

    Click                        sp7-dist-ocorrencias-botao.png
    Wait Until Screen Contain    sp7-dist-ocorrencias-abas.png          100
    Click                        sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais.png
    Sleep                        10
    Click                        botãoLiberarListagem.png
    Sleep                        10
    Click                        taferas-nome-retirarFiltro.png
    Sleep                        10
    Click                        filtro.png
    Sleep                        5
    Minimiza sp7
    Type With Modifiers            r              WIN
    Press Special Key              DELETE
    Input Text                  windows-r.png        ${TA} 
    Click                         windows-r.png 
    Type With Modifiers             a           CTRL
    Type With Modifiers            c              CTRL
    Click                       sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-nomeDispositivo.png        0       18
    Type With Modifiers            v              CTRL
    Wait Until Screen Contain     sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-nomeDispositivo-preenchido.png    15
    Press Special Key           ENTER
    Sleep                        5
    Click                       sp7-dist-botaoUltimaPágina.png
    SLeep                          10 
    Wheel Down                     1
    Set Screenshot Directory      ${IMAGE_DIR}
    Take Partial Screenshot	   sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-idOcor.png    none    none    765	     650    105    200      true   800px   1
    ${IDS}=   Get Text    sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-idOcor.png
    Set Global Variable    ${IDS}
    E fecha "gerenciamento de ocorrências"

  
E verifico as ocorrências emergenciais após ocorrência

   Click                       sp7-dist-ocorrencias-botao.png
    Wait Until Screen Contain   sp7-dist-ocorrencias-abas.png          100
    Click                       sp7-dist-botaoUltimaPágina.png
    Sleep                       5
    Wheel Down                     1
    Set Screenshot Directory      ${IMAGE_DIR}
    Take Partial Screenshot	   sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-idOcor2.png    none    none    764	     650    105    200      true   800px   1
    ${IDS2}=   Get Text    sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-idOcor2.png
    Set Global Variable    ${IDS2}
    E fecha "gerenciamento de ocorrências"

Então uma nova ocorrência é gerado no relatório

  Should Not Be Equal As Strings    ${IDS}    ${IDS2}

E estou na aba "Ocorrências Emergênciais"

    Wait Until Screen Contain   sp7-dist-ocorrencias-abas.png          100
    Click                       sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais.png
    Sleep                       20


E seleciono ocorrência

    Click                        sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-id.png 
    Wait Until Screen Contain    sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-tarefas.png     100
    Right Click                  sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-tarefas-titulo.png
    Click                        maximiza.png


Quando crio uma nova tarefa
    Click                           sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-tarefas-equipe.png
    Sleep                           5
    E verifico grid 
    Click                           sp7-dist-chamada-novo.png   
    Wait Until Screen Contain       sp7-botaoSalvarFechar.png           100
    Click                           sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-salvar.png
    Right Click                      taferas-nome-interno.png
    Click                            copiar.png
    ${VAR}=                        Get_Text_From_Clipboard                   
    Set Global Variable    ${VAR}
    Sleep                           5

E verifico grid
 #   ${imageCoordinates}=	       Get Image Coordinates	sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-tarefas-equipes-nomeEquipe.png=0.75
    Set Screenshot Directory      ${IMAGE_DIR}
    Take Partial Screenshot	   sp7-dist-ocorrencias-ocorrenciasEmergênciais-tarefa-grid2.png    none    none    246	     215    105    150      true   800px   1
    ${TAREFA}=   Get Text      sp7-dist-ocorrencias-ocorrenciasEmergênciais-tarefa-grid2.png
    Set Global Variable    ${TAREFA}

Então tarefa é apresentada no grid de tarefas 

    Set Screenshot Directory      ${IMAGE_DIR}
    Take Partial Screenshot	   sp7-dist-ocorrencias-ocorrenciasEmergênciais-tarefa-grid1.png    none    none    246	     215    105    150      true   800px   1
    ${TAREFA2}=   Get Text      sp7-dist-ocorrencias-ocorrenciasEmergênciais-tarefa-grid1.png
    Should Not Be Equal As Strings   ${TAREFA}    ${TAREFA2}

E fecha tarefas
    Right Click                  sp7-dist-ocorrencias-aba-ocorrenciasEmergênciais-tarefas-titulo.png
    Click                        fechar.png


Quando associo uma equipe disponivel
    Click    refresh.png
    Sleep    5
    Click    taferas-nome-despachoViaVoz.png
    Click    sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-salvar.png
    Click    maximiza.png
    Click       taferas-nome-equipeDisponivel.png
    Click       taferas-nome-equipeDisponivel- botaoAtribuir.png
    Sleep       5
    
E evoluo os status da tarefa
    Click       taferas-nome-statusAtribuido.png
    Click       taferas-nome-despachado.png
    Click       sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-salvar.png
    Sleep           7
    Click          taferas-nome-statusDespachado.png
    Click          taferas-nome-aCaminho.png
    Click          sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-salvar.png
    Sleep           7
    Click          taferas-nome-statusAcaminho.png
    Click          taferas-nome-executando.png
    Click          sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-salvar.png
    Sleep          7
    click           taferas-nome-statusExecutando.png
    Click           taferas-nome-completado.png
    Click           sp7-dist-ocorrencias-aba-ocorrenciaPlanejada-salvar.png
    

Então as datas de realizado são preechida 

    Click    taferas-nome-planejado.png
    Press Special Key       TAB
    Type With Modifiers            c              CTRL
    ${VAR1}=     Get_Text_From_Clipboard
    Should Not Be Empty   ${VAR1}
    click       taferas-nome-dataDespacho.png
    Press Special Key       TAB
    Type With Modifiers            c              CTRL
    ${VAR2}=     Get_Text_From_Clipboard
    Press Special Key       TAB
    Press Special Key       TAB
    Type With Modifiers            c              CTRL
    ${VAR3}=     Get_Text_From_Clipboard
    Press Special Key       TAB
    Press Special Key       TAB
    Type With Modifiers            c              CTRL
    ${VAR4}=     Get_Text_From_Clipboard
    Press Special Key       TAB
    Press Special Key       TAB
    Type With Modifiers            c              CTRL
    ${VAR5}=     Get_Text_From_Clipboard

E fecha detalhes da tarefa
    Right Click       tarefa-detalheTarefa-titulo.png
    Click             fechar.png

Dado que estou na tela de detalhes da ocorrência
    E estou na aba "DISTRIBUIÇÃO"
    E Estou na tela "Ocorrências"
    Minimiza sp7
    E estou na aba "Ocorrências Emergênciais"

E seleciono ocorrência condicional

    ${score} =	Get Match Score	 ocorrenciasEmergenciais-listagem-numero.png		
    Run Keyword if	${score} > 0.85	clicar no amarelo	ELSE	clicar em outro

clicar no amarelo
    Click                       ocorrenciasEmergenciais-listagem-numero.png

clicar em outro
        Click                       ocorrenciasEmergenciais-listagem-numero2.png

Quando preencho os dados básicos 

    
    Wait Until Screen Contain   ocorrenciasEmergenciais-listagem-numero-ID.png          100
    Click                       maximiza.png
    Click                       ocorrenciasEmergenciais-detalhes-dadosBasicos.png
    Wait Until Screen Contain   ocorrenciasEmergenciais-detalhes-atribuiDono.png        100
    Click                       ocorrenciasEmergenciais-detalhes-atribuiDono.png
    Sleep                       10
    click                       ocorrenciasEmergenciais-detalhes-dadosBasicos-tipoOrigem.png     90     0
    Press Special Key           DOWN
    Sleep                       1
    Press Special Key           ENTER
    Press Special Key           TAB
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1    
    Press Special Key           TAB
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1 
    Press Special Key           TAB
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1 
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1 
    Input Text                  ocorrenciasEmergenciais-detalhes-dadosBasicos-descrição.png         Automacao
    Input Text                  ocorrenciasEmergenciais-detalhes-dadosBasicos-condiçãoTempo.png         1
    Input Text                  ocorrenciasEmergenciais-detalhes-dadosBasicos-elementoFalha.png      Teste
    Click                       ocorrenciasEmergenciais-detalhes-dadosBasicos-tipoElementoFalha.png     90          0
    Press Special Key           DOWN
    Press Special Key           DOWN
    Sleep                       1 
    Press Special Key           ENTER

E clico em "Salvar" condicional 
    ${score} =	    Get Match Score	        ocorrenciasEmergenciais-detalhes-dadosBasicos-nenhum.png		
    Run Keyword if	${score} > 0.85	  keyword1	  ELSE	  keyword2

keyword2

    Wheel Down	    5
    Click           sp7-dist-chamada-nova-salvar2.png    

keyword1
    click                       ocorrenciasEmergenciais-detalhes-dadosBasicos-tipoOrigem.png     90     0
    Press Special Key           DOWN
    Sleep                       1
    Press Special Key           ENTER
    Press Special Key           TAB
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1    
    Press Special Key           TAB
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1 
    Press Special Key           TAB
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1 
    Press Special Key           TAB
    Press Special Key           DOWN
    Sleep                       1 
    Click                       ocorrenciasEmergenciais-detalhes-dadosBasicos-tipoElementoFalha.png     90          0
    Press Special Key           DOWN
    Press Special Key           DOWN
    Sleep                       1 
    Press Special Key           ENTER
    

Então aparece a mensagem salvo com sucesso

    Wheel Down	                    5
    Click           sp7-dist-chamada-nova-salvar2.png 
    Wait Until Screen Contain       ocorrenciasEmergenciais-detalhes-dadosBasicos-salvoComSucesso.png      10
    Screen Should Contain           ocorrenciasEmergenciais-detalhes-dadosBasicos-salvoComSucesso.png

Completar Ocorrencia
    Right Click      US-S313Bay7CB.png
    Mouse Move       alter-status-ocorr.png
    Click            status-ocorr-complete.png
    Wait Until Screen Contain     registro-status-completado.png    10

Arquivar Ocorrencia
    Right Click      US-S313Bay7CB.png
    Mouse Move       alter-status-ocorr.png
    Click            status-ocorr-fechado.png
    Right Click      US-S313Bay7CB.png
    Click            arquivar-ocorr.png

E estou no Historico de ocorrencias
    Click            sp7-historico.png
    Wait Until Screen Contain     sp7-aba-historico.png    10
    Click            sp7-historico-ocorrencias.png
    Wait Until Screen Contain     sp7-historico-ocorrencias-pagina.png    10
    Click            todas-as-ocorrencias.png
    Wait Until Screen Contain     US-S313Bay7CB-arquivado.png    10