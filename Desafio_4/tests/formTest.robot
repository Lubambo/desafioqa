*** Settings ***
Documentation  Verifica se as opções selecionadas são apresentadas no TextView
...            e se apresentam como 'checked' na lista da tela Form.
Default Tags  all  form

Library   DataDriver  ${EXECDIR}/data/formTest.csv  dialect=excel-tab  encoding=utf_8

Resource  ${EXECDIR}/resource/AppSessionManager.robot
Resource  ${EXECDIR}/resource/ElementsManager.robot
Resource  ${EXECDIR}/resource/AppAccess.robot
Resource  ${EXECDIR}/resource/Utils.robot

Resource  ${EXECDIR}/pageObjects/Home.robot
Resource  ${EXECDIR}/pageObjects/Menu.robot
Resource  ${EXECDIR}/pageObjects/Form.robot

Suite Setup     Open Session
Suite Teardown  Close Session

Test Setup     Start Procedure
Test Teardown  Quit Application

Test Template  Template Keyword

*** Test Case ***
Form - Selecionando [${option1}] e [${option2}]

*** Keywords ***
Start Procedure
    Launch Application
    App Login  ${project.get('user', 'login')}  ${project.get('user', 'password')}
    Check Element Contains Text  ${homeWelcomeText.locator}  ${homeWelcomeText.text}

Template Keyword
    [Arguments]  ${option1}  ${option2}

    # Acessa o menu.
    Wait Until Element Is Visible  ${menuBtn}
    Click Element  ${menuBtn}

    # Acessa a tela Form.
    Wait Until Element Is Visible  ${menuFormBtn}
    Click Element  ${menuFormBtn}

    # Inicia o teste propriamente dito.
    Wait Until Element Is Visible  ${listBase}  ${project.get('prop', 'defaultTimeout')}
    Check Element Contains Text    ${formWelcomeText.locator}  ${formWelcomeText.text}
    
    Select Option By Text  ${option1}
    Select Option By Text  ${option2}
    
    ${count}  Count Selected Items
    Should Be Equal As Integers  ${count}  2

    ${expectedListText}  Mount Expected Selected Options List Text  ${option1}  ${option2}
    ${listText}          Get Text  ${formSelectedListText}
    Should Be Equal As Strings  ${listText}  ${expectedListText}

    Take Evidence