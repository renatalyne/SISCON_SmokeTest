*** Settings ***

Library      SikuliLibrary
Library     OperatingSystem


*** Variables ***

${IMAGE_DIR}       ${EXECDIR}\\resources\\elements
${PATH}            C:\\Program Files\\Siemens\\SpectrumPower7\\odvlauncher
${EXEC_SPECTRUM}   odvlauncher.exe -admin
${TEMPLATE_DIR}    C:\\temp\\template.txt
${TEMPO}           10
${SLEEP}           40
${TIPO2}           Ocorrência indefinida

*** Keywords ***

Abrir notepad template

  Type With Modifiers    r    WIN
  Press Special Key    DELETE
  Input Text     windows-cmd-abrir.png    ${TEMPLATE_DIR}
  Press Special Key    ENTER
  Sleep       2
  Click       win-blocoNotas-titulo.png
  Type With Modifiers    a    CTRL
  Type With Modifiers    v    CTRL
  Type With Modifiers    s    CTRL
  Right Click    win-blocoNotas-titulo.png
  Click    win-blocoNotas-titulo-fechar.png


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
    Click                         sp7-icone.png

Então aparece a nova CHAMADA no grid
    Wait Until Screen Contain    sp7-chamada-result-tipo.png    ${TEMPO}
    Screen Should Contain    sp7-chamada-result-titulo.png
    Sleep    ${SLEEP}
    Right Click    sp7-chamada-result-tipo.png
    Click    copiar.png

E valida tipo de ocorrência diferente de "Ocorrência indefinida"
    Abrir notepad template
    ${TIPO_OCOR} =	  Get File	  ${TEMPLATE_DIR}
    Right Click   sp7-chamada-result-idOcorrencia.png
    Click         copiar.png
    Abrir notepad template
    ${ID_OCOR} =	   Get File	  ${TEMPLATE_DIR}
    Should Not Be Empty    ${TIPO_OCOR}
    Should Not Be Equal As Strings    ${TIPO_OCOR}    ${TIPO2}


E valida tipo de ocorrência igual a "Ocorrência indefinida"
    Abrir notepad template
    ${TIPO_OCOR} =	  Get File	  ${TEMPLATE_DIR}
    Right Click   sp7-chamada-result-idOcorrencia.png
    Click         copiar.png
    Abrir notepad template
    ${ID_OCOR} =	  Get File	  ${TEMPLATE_DIR}
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


E clico em chamar
  Click    sp7-listaTelas-chamar.png
  SLeep    3



E abro chave escolhida
  Right Click    sp7-listaTelas-chamar-simboloVerde.png
  Click         sp7-listaTelas-chamar-simboloVerde-gerOcorrencia.png
  Click         sp7-listaTelas-chamar-simboloVerde-gerOcorrencia-hist.png
  Sleep         2
  ${imageCoordinates}=	       Get Image Coordinates    sp7-listaTelas-gerenciamento-historico-interno-idOcor.png
  ${TEXTO}=     Get Text    Capture Region    ${imageCoordinates}
  Right Click    sp7-listaTelas-gerenciamento-historico-titulo.png
  Click    fechar.png
  Right Click    sp7-listaTelas-chamar-simboloVerde.png
  Click          sp7-listaTelas-chamar-simboloVerde-abrir.png
  Input Text     sp7-listaTelas-chamar-simboloVerde-abrir-cometario.png    Automacao
