*** Settings ***

Library      SikuliLibrary

*** Variables ***

${IMAGE_DIR}       C:\\Users\\radek\\Documents\\SISCON_SmokeTest\\resources\\elements
${PATH}            C:\\Program Files\\Siemens\\SpectrumPower7\\odvlauncher
${EXEC_SPECTRUM}   odvlauncher.exe -admin
${TEMPO}           10

*** Keywords ***

Add Needed Image Path
    Add Image Path         ${IMAGE_DIR}

Abre a pesquisa
    Click    lupa-windows.png

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
    Click                        minimizar.png
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
    Wait Until Screen Contain    sp7-dadosReclamante-buscar-buscar-ultimachamada2.png     ${TEMPO}
    Click                        sp7-dadosReclamante-buscar-buscar-ultimachamada2.png
    Wait Until Screen Contain    sp7-dadosReclamante-buscar-buscar-ultimachamada3.png     ${TEMPO}
    Click                        sp7-dadosReclamante-buscar-buscar-copiar.png
    Wait Until Screen Contain    sp7-chamada-interno.png                                  ${TEMPO}
E preenche estado
    ${imageCoordinates}=	       Get Image Coordinates	sp7-dist-chamada-dados-estado.png=0.65
    Click Region                 ${imageCoordinates}
    Click                        sp7-dist-chamada-dados-estado-pernambuco
    Wait Until Screen Not Contain    sp7-dist-chamada-dados-cidadevazia                   ${TEMPO}
    ${score} =	Get Match Score                  sp7-dist-chamada-nova-salvar2.png
    ${imageCoordinates}=	       Get Image Coordinates	sp7-dist-chamada-nova-salvar2.png=0.75
    #Click Region                 ${imageCoordinates}

E Fecha página Chamadas
    Right Click                   sp7-dist-chamada-titulo-detalhesdachamada.png
    Click                         fechar.png
    Right Click                   sp7-dist-chamada-titulo-listagem.png
    Click                         fechar.png
    Click                         sp7-icone.png
