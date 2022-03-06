*** Settings ***
Documentation  Especificação dos testes do CT1.

Resource  ./Common.robot

*** Keywords ***
Get Body Values To Validate
    [Arguments]  ${movieTitle}  ${movieYear}  ${movieLanguage}

    ${title}       Create Dictionary  key=Title     value=${movieTitle}  
    ${year}        Create Dictionary  key=Year      value=${movieYear}  
    ${language}    Create Dictionary  key=Language  value=${movieLanguage}
    ${bodyValues}  Create List  ${title}  ${year}  ${language}

    [Return]  ${bodyValues}

Validate Endpoint
    [Arguments]  ${movieId}  ${movieTitle}  ${movieYear}  ${movieLanguage}  ${expectedStatusCode}

    ${response}            Make Request By Movie Id  ${movieId}
    ${expectedHeaders}     Get Headers To Validate
    ${expectedBodyValues}  Get Body Values To Validate  ${movieTitle}  ${movieYear}  ${movieLanguage}
    ${expectedSchema}      Set Variable  ${EXECDIR}/data/jsonSchemas/validMovie.json

    Check Response  ${response}  ${expectedStatusCode}  ${expectedHeaders}  ${expectedSchema}  ${expectedBodyValues}