*** Settings ***
Documentation  Especificação dos testes do CT2.

Resource  ./Common.robot

*** Keywords ***
Get Body Values To Validate
    [Arguments]  ${errorMsg}  ${responseExists}

    ${errorMsg}     Create Dictionary  key=Error     value=${errorMsg}  
    ${hasResponse}  Create Dictionary  key=Response  value=${responseExists}
    ${bodyValues}   Create List  ${errorMsg}  ${hasResponse}

    [Return]  ${bodyValues}

Validate Endpoint
    [Arguments]  ${movieId}  ${errorMsg}  ${responseExists}  ${expectedStatusCode}

    ${response}            Make Request By Movie Id  ${movieId}
    ${expectedHeaders}     Get Headers To Validate
    ${expectedBodyValues}  Get Body Values To Validate  ${errorMsg}  ${responseExists}
    ${expectedSchema}      Set Variable  ${EXECDIR}/data/jsonSchemas/invalidMovie.json

    Check Response  ${response}  ${expectedStatusCode}  ${expectedHeaders}  ${expectedSchema}  ${expectedBodyValues}