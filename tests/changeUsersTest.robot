*** Settings ***

Resource          ${EXECDIR}\\resources\\bases\\changeUsersBase.robot
Test Setup        Add Change Users Image Path
Test Teardown     Stop Remote Server

*** Variables ***
${Login}            testeQA
${Environment}      dvl      
${RuntimeSetting}   RuntimeSetting(dvl).PNG  

*** Test Cases ***
###########################################################################
#Cenário 1 - 2: Tentar trocar de usúario para Teste (esperado falha por acabar de ter sido criado)
###########################################################################

Cenário 00: Setup 
    [Tags]      Cenário 00
        IF      "${Environment}" == "dvl"     
            set Global Variable      ${RuntimeSetting}      RuntimeSetting(dvl).PNG
        END   
        IF      "${Environment}" == "admmst"     
            set Global Variable      ${RuntimeSetting}      RuntimeSetting(admmst).PNG
        END
    [Teardown]

Cenário 01: Abrir tela de Troca Usuário
    [Tags]      Cenário 01
        log     "Abrir tela de Troca Usuário"
        Given that I'm in BaSiDi
        And Clicked on "Trocar Usuário"
        Then the change user windows should appeared
    [Teardown]

Cenário 02: Fill in the data
    [Tags]    Cenário 02
        log     "Preenche formulário de troca de usuário"
        ${Password}     set Variable    testeQA
        When the data is filled     ${Login}     ${Password}
        Then an expected error should appeared
    [Teardown]



###########################################################################
#Cenário 3 - 12: Fecha o BaSiDi, abre ele novamente tentando logar com o usuário teste
###########################################################################


Cenário 03: Close BaSiDi
    [Tags]      Cenário 03
        log     "Fechar BaSiDi"
        And try to close BasiDi
        Then BasiDi should be closed sucessfully
    [Teardown]

Cenário 04: Open BaSiDi
    [Tags]      Cenário 04
        log      "Reabre o BaSiDi"
        When BaSiDi Login screen is opened          ${RuntimeSetting}
        Then an security message should appeared

    [Teardown]

Cenário 05: Try Login in BaSiDi
    [Tags]      Cenário 05
        log     "Preenche login e senha"
        ${Password}     set Variable    testeQA       
        log     "Tenta Logar no BaSiDi"
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then an expered password message should appeared

    [Teardown]

Cenário 06: New password failure
    [Tags]      Cenário 06
        log     "Falha em gerar uma nova senha"
        ${Password}     set Variable    testeQA 
        When the BaSiDi new password field is filled      ${Password}
        Then and short password message should appeared

    [Teardown]

Cenário 07: Try Login in BaSiDi
    [Tags]      Cenário 07
        log     "Preenche login e senha"cd C:\Program Files\Siemens\SpectrumPower7\odvlauncher
        
        ${Login}        set Variable    testeQA
        ${Password}     set Variable    testeQA       
        log     "Tenta Logar no BaSiDi"
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then an expered password message should appeared

    [Teardown]

Cenário 08: New password failure 2
    [Tags]      Cenário 08
        log     "Falha em gerar uma nova senha 2"
        ${Password}     set Variable    testeteste
        When the BaSiDi new password field is filled      ${Password}
        Then and no numeric in password message should appeared

    [Teardown]

Cenário 09: Try Login in BaSiDi
    [Tags]      Cenário 09
        log     "Preenche login e senha"
        ${Login}        set Variable    testeQA
        ${Password}     set Variable    testeQA        
        log     "Tenta Logar no BaSiDi"
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then an expered password message should appeared

    [Teardown]

Cenário 10: New password failure 3
    [Tags]      Cenário 10
        log     "Sucesso em gerar uma nova senha"
        ${Password}     set Variable    testeteste
        When the BaSiDi new password field is filled      ${Password}
        Then and no numeric in password message should appeared

    [Teardown]

Cenário 11: Try Login in BaSiDi
    [Tags]      Cenário 11
        log     "Preenche login e senha"
        ${Login}        set Variable    testeQA
        ${Password}     set Variable    testeQA        
        log     "Tenta Logar no BaSiDi"
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then an expered password message should appeared

    [Teardown]

Cenário 12: New password sucess
    [Tags]      Cenário 12
        log     "Sucesso em gerar uma nova senha"
        ${Password}     set Variable    teste123
        When the BaSiDi new password field is filled      ${Password}
        Then the sucesfull password changed successfully message should appeared

    [Teardown]

###########################################################################
#Cenário 13 - 14: Trocam para o Usuário SPECTRUM
###########################################################################
Cenário 13: Abrir tela de Troca Usuário
    [Tags]      Cenário 13
        log     "Abrir tela de Troca Usuário"
        Given that I'm in BaSiDi
        And Clicked on "Trocar Usuário"
        Then the change user windows should appeared
    [Teardown]

Cenário 14: Fill in the data
    [Tags]      Cenário 14
        log     "Preenche formulário de troca de usuário"
        ${Login}        set Variable    spectrum
        ${Password}     set Variable    spectrum
        When the data is filled    ${Login}     ${Password}
        Then an sucessfull message should appeared

    [Teardown]
