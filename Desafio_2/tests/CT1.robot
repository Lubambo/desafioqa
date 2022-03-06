*** Settings ***
Documentation  Verifica se o filme obtido pelo endpoint possui
...            os valores esperados para título, ano e idioma.
Default Tags  all  ct1

Library   DataDriver  ${EXECDIR}/data/testData/validMovies.csv  dialect=excel-tab

Resource  ${EXECDIR}/spec/CT1.robot

Variables  ${EXECDIR}/locators.py

Test Template  Template Keyword

*** Test Case ***
Validando filme ${expectedTitle} [id: ${movieId}]

*** Keywords ***
Template Keyword
    [Arguments]  ${movieId}  ${expectedTitle}  ${expectedYear}  ${expectedLanguage}  ${expectedStatusCode}
    Validate Endpoint  ${movieId}  ${expectedTitle}  ${expectedYear}  ${expectedLanguage}  ${expectedStatusCode}




