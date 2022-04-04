# *** Settings ***

# Library     SikuliLibrary
# Library     OperatingSystem
# Library     ScreenCapLibrary
# Library     ${EXECDIR}/resources/libraries/nova.py

# *** Variables ***

# ${IMAGE_DIR}       C:\\Users\\radek\\Documents\\GitHub\\SISCON_SmokeTest\\resources\\elements
# ${PATH}            C:\\Program Files\\Siemens\\SpectrumPower7\\odvlauncher
# ${EXEC_SPECTRUM}   odvlauncher.exe -admin
# ${TEMPLATE_DIR}    C:\\temp\\template.txt
# ${TEMPO}           10
# ${SLEEP}           40
# ${TIPO2}           Ocorrência indefinida
# ${MAQUINA}         dvl81ibd
# ${LOGIN}           rcarvalho
# ${PASSWORD}        S3nh4@01

# *** Keywords ***


# Teste screenshot parcial

#     Set Screenshot Directory    ${IMAGE_DIR}
    
#     #Take Partial Screenshot   teste.png  none    none   1600      0    100    100   1
#     Take Screenshot  teste.png	 none      none      300px      0       1	

# Teste clipboard
#      ${TEXTO}=   Get Text From Clipboard

# Abrir putty
#     Double click         icone.png
#     Input Text           putty-hostName.png         ${MAQUINA}    
#     Click                putty-open.png
#     Input Text           putty-login.png            ${LOGIN}
#     Press Special Key    ENTER
#     Input Text           putty-password.png         ${PASSWORD}
#     Press Special Key    ENTER
    
# *** Test Cases ***

# #Teste screeshot parcial
#  # Teste screenshot parcial

# #Teste clipboard
#  # Teste clipboard


# #Abrir putty
#  # Abrir putty

# Coverter para string 

#         ${STRING} =        Convert To String                  ta/MT_11606/13TRF/C00704/CB/Status