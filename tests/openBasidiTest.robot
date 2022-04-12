*** Settings ***

Resource          ${EXECDIR}\\resources\\bases\\changeUsersBase.robot
Test Setup        Add Change Users Image Path
Test Teardown     Stop Remote Server

*** Variables ***
${Login}            spectrum
${Password}         spectrum
${Environment}      dvl  

*** Test Cases ***
Cenário 00: Setup 
    [Tags]      Cenário 00
        IF      "${Environment}" == "dvl"     
            set Global Variable      ${Environment}      RuntimeSetting(dvl).PNG
        END   
        IF      "${Environment}" == "admmst"     
            set Global Variable      ${Environment}      RuntimeSetting(admmst).PNG
        END

    [Teardown]    

Cenário 01: Open BaSiDi
    [Tags]      Cenário 01
        log      "Abre o BaSiDi"
        When BaSiDi Login screen is opened          ${ENVIRONMENT}
        Then an security message should appeared
    [Teardown]

Cenário 02: Try Login in BaSiDi
    [Tags]      Cenário 02
        log     "Preenche login e senha"        
        When the BaSiDi Login screen is filled  ${Login}     ${Password}
        Then the BaSiDi screen should appeared
    [Teardown]