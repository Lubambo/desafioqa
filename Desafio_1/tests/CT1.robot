*** Settings ***
Documentation  Verifica se o resultado obtido na pesquisa retorna
...            itens com cidade e especialidade esperados.
Default Tags  all  ct1

Library   SeleniumLibrary
Library   DataDriver  ${EXECDIR}/data/CT1testData.csv  encoding=utf_8

Resource  ${EXECDIR}/spec/CT1.robot

Variables  ${EXECDIR}/locators.py

Test Teardown  Close All Browsers
Test Template  BDD Template

*** Test Case ***
Solicitar medicos do estado ${estado} de especialidade ${especialidade}

*** Keywords ***
BDD Template
    [Arguments]  ${project.get('prop', 'URL')}  ${browser}  ${estado}  ${especialidade}  ${ufEsperada}
    CT1 BDD Spec  ${project.get('prop', 'URL')}  ${browser}  ${estado}  ${especialidade}  ${ufEsperada}




