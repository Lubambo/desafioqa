*** Settings ***
Documentation  Gerencia o acesso ao app.

Library  AppiumLibrary

Resource  ${EXECDIR}/resource/Utils.robot
Resource  ${EXECDIR}/pageObjects/Login.robot

*** Keywords ***
App Login
    [Arguments]  ${user}  ${password}
    Set Input Text  ${loginInput}     ${user}
    Set Input Text  ${passwordInput}  ${password}
    Click Go Back Button
    Click Element   ${submitBtn}