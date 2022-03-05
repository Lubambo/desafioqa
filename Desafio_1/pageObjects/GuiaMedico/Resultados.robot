*** Settings ***
Documentation  Page Object contendo o mapeamento da página de Resultados de Busca do Guia Médico.

*** Variables ***
${guiaMedicoTitle}  Guia Médico - Site Institucional

# Mensagem apresentando número de resultados obtidos na pesquisa.
${searchMsg}  css:#gm-v3-root > div span

# Lista de resultados.
${resultList}  css:#gm-v3-root > div > div:nth-child(2) > div.col-lg-9 > div.d-block > div:nth-child(2)

# Botão "Ver mais resultados".
${showMoreBtn}  css:#gm-v3-root > div > div:nth-child(2) > div.col-lg-9 > div.d-block > div.d-flex.justify-content-center.row > button

*** Keywords ***
Get List Item Locator By Index
    [Arguments]  ${index}
    ${item}  Set Variable  ${resultList} > div:nth-child(${index})
    [Return]  ${item}

Get Item Description Property
    [Arguments]  ${index}
    ${locator}  Get List Item Locator By Index  ${index}
    ${locator}  Set Variable  ${locator} > div > div:nth-child(1) > div:nth-child(3)
    Wait Until Element Is Visible  ${locator}  30
    ${itemProp}  Get WebElement  ${locator}
    [Return]  ${itemProp}

Get Item Localization Property
    [Arguments]  ${index}
    ${locator}  Get List Item Locator By Index  ${index}
    ${locator}  Set Variable  ${locator} > div > div:nth-child(2) > div:nth-child(1) > a
    Wait Until Element Is Visible  ${locator}  30
    ${itemProp}  Get WebElement  ${locator}
    [Return]  ${itemProp}