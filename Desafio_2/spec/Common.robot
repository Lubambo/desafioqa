*** Settings ***
Documentation  Ações que se repetem utilizadas na especificação de mais de um teste.

Resource  ${EXECDIR}/resource/RequestManager.robot

*** Keywords ***
Make Request By Movie Id
    [Arguments]  ${movieId}

    ${url}  Create Movie Id Endpoint Url  ${movieId}
    ${response}  GET  ${url}

    [Return]  ${response}

Get Headers To Validate
    ${contentType}    Create Dictionary  key=content-type  value=application/json; charset=utf-8
    ${headersValues}  Create List  ${contentType}

    [Return]  ${headersValues}