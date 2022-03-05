*** Settings ***
Documentation  Especificação dos testes do CT1.

Resource  ${EXECDIR}/pageObjects/Home.robot
Resource  ${EXECDIR}/pageObjects/GuiaMedico/Busca.robot
Resource  ${EXECDIR}/pageObjects/GuiaMedico/Resultados.robot

*** Keywords ***
Estou no portal da Unimed
    [Arguments]  ${url}  ${browser}
    Open Browser  ${url}  ${browser}
    Title Should Be  ${homeTitle}

Acesso o Guia Medico
    Click Element  ${guiaMedicoBtn}
    Title Should Be  ${guiaMedicoTitle}

Pesquiso medicos do estado ${estado} com especialidade em ${especialidade}
    Click element  ${advancedSearchBtn}
    Input Text     ${doctorNameInput}  ${SPACE}
    Input Text     ${specialtyInput}  ${especialidade}
    Press Keys     ${specialtyInput}  RETURN
    Input Text     ${stateSelect}  ${estado}
    Press Keys     ${stateSelect}  RETURN
    Click Button   ${searchBtn}

O contador de resultado informa quantos medicos foram encontrados
    ${searchMsgText}  Get Text  ${searchMsg}
    ${regex}  Set Variable  ^\\w.+\\d+\\s\\w+.+\\.$
    Should Match Regexp  ${searchMsgText}  ${regex}

Os itens da lista de resultados devem conter a UF ${ufEsperada} e a especialidade ${especialidade}
    FOR  ${index}  IN RANGE  1  21
        ${descProp}  Get Item Description Property  ${index}
        Element Should Contain  ${descProp}  ${especialidade}

        ${localProp}  Get Item Localization Property  ${index}
        Element Should Contain  ${localProp}  /${ufEsperada}
    END

CT1 BDD Spec
    [Arguments]  ${url}  ${browser}  ${estado}  ${especialidade}  ${ufEsperada}
    Given estou no portal da Unimed  ${url}  ${browser}
    And acesso o Guia Medico
    When pesquiso medicos do estado ${estado} com especialidade em ${especialidade}
    Then o contador de resultado informa quantos medicos foram encontrados
    And os itens da lista de resultados devem conter a UF ${ufEsperada} e a especialidade ${especialidade}