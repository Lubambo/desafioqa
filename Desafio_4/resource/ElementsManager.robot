*** Settings ***
Documentation  Auxilia no gerenciamento de ações que se repetem para os elementos na tela.

Library  AppiumLibrary
Library  String

Variables  ${EXECDIR}/locators.py

*** Keywords ***
Set Input Text
    [Arguments]  ${locator}  ${text}
    Wait Until Element Is Visible  ${locator}  ${project.get('prop', 'defaultTimeout')}
    Click Element  ${locator}
    Clear Text     ${locator}
    Input Text     ${locator}  ${text}

Check Element Contains Text
    [Arguments]  ${locator}  ${text}
    Wait Until Element Is Visible  ${locator}  ${project.get('prop', 'defaultTimeout')}
    ${textElem}  Get Text  ${locator}
    ${text}      Convert To Lower Case  ${text}
    ${textElem}  Convert To Lower Case  ${textElem}
    ${hasText}   Evaluate  '${text}' in '${textElem}'
    Should Be True  ${hasText}

Check Element Exact Text
    [Arguments]  ${locator}  ${text}
    Wait Until Element Is Visible  ${locator}  ${project.get('prop', 'defaultTimeout')}
    Element Text Should Be  ${locator}  ${text}