*** Settings ***
Documentation  Keywords para auxiliar na codificação.

Library  AppiumLibrary
Library  String

*** Keywords ***
Take Evidence
    [Documentation]  Gera um screenshot nomeado com: 'nome do teste' + 'nome passado no parâmetro'
    [Arguments]  ${filename}=${EMPTY}
    
    ${path}  Set Variable  ${TEST NAME}

    IF  '${filename}' != '${EMPTY}'
        ${path}  Catenate  SEPARATOR=${SPACE}  ${path}  -  ${filename}
    END
    
    ${path}  Replace String  ${path}  :  ${EMPTY}
    Capture Page Screenshot  ${path}

Click Go Back Button
    [Documentation]  Simula o clique do botão voltar do teclado.
    Press Keycode  4