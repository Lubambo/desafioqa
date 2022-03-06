*** Settings ***
Documentation  Verifica se a response obtida pelo endpoint de
...            filme inválido corresponde às propriedades esperadas.
Default Tags  all  ct2

Library   DataDriver  ${EXECDIR}/data/testData/invalidMovies.csv  dialect=excel-tab

Resource  ${EXECDIR}/spec/CT2.robot

Variables  ${EXECDIR}/locators.py

Test Template  Template Keyword

*** Test Case ***
Validando filme inexistente [id: ${movieId}]

*** Keywords ***
Template Keyword
    [Arguments]  ${movieId}  ${errorMsg}  ${responseExists}  ${expectedStatusCode}
    Validate Endpoint  ${movieId}  ${errorMsg}  ${responseExists}  ${expectedStatusCode}




