*** Settings ***
Documentation  Verifica se o resultado obtido na pesquisa não retorna
...            itens com cidade São Paulo/SP até a página informada.
Default Tags  all  ct2

Library   SeleniumLibrary
Library   DataDriver  ${EXECDIR}/data/CT2testData.csv  encoding=utf_8

Resource  ${EXECDIR}/spec/CT2.robot

Variables  ${EXECDIR}/locators.py

Test Teardown  Close All Browsers
Test Template  BDD Template

*** Test Case ***
Solicitar medicos do estado ${estado} e especialidade ${especialidade} nao retorna local ${localIndesejado} ate a pagina ${pagina}

*** Keywords ***
BDD Template
    [Arguments]  ${project.get('prop', 'URL')}  ${browser}  ${estado}  ${especialidade}  ${localIndesejado}  ${pagina}
    CT2 BDD Spec  ${project.get('prop', 'URL')}  ${browser}  ${estado}  ${especialidade}  ${localIndesejado}  ${pagina}