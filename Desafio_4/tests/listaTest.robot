*** Settings ***
Documentation  Verifica se a pesquisa na tela Lista retorna os resultados esperados.
Default Tags  all  lista

Library   DataDriver  ${EXECDIR}/data/listaTest.csv  dialect=excel-tab  encoding=utf_8

Resource  ${EXECDIR}/resource/AppSessionManager.robot
Resource  ${EXECDIR}/resource/ElementsManager.robot
Resource  ${EXECDIR}/resource/AppAccess.robot
Resource  ${EXECDIR}/resource/Utils.robot

Resource  ${EXECDIR}/pageObjects/Home.robot
Resource  ${EXECDIR}/pageObjects/Menu.robot
Resource  ${EXECDIR}/pageObjects/Lista.robot

Suite Setup     Open Session
Suite Teardown  Close Session

Test Setup     Start Procedure
Test Teardown  Quit Application

Test Template  Template Keyword

*** Test Case ***
Lista - Pesquisar item ${testDescription}

*** Keywords ***
Start Procedure
    Launch Application
    App Login  ${project.get('user', 'login')}  ${project.get('user', 'password')}
    Check Element Contains Text  ${homeWelcomeText.locator}  ${homeWelcomeText.text}

Template Keyword
    [Arguments]  ${validSearch}  ${inputName}  ${testDescription}

    # Acessa o menu.
    Wait Until Element Is Visible  ${menuBtn}
    Click Element  ${menuBtn}

    # Acessa a tela Lista.
    Wait Until Element Is Visible  ${menuListaBtn}
    Click Element  ${menuListaBtn}

    # Inicia o teste propriamente dito.
    Wait Until Element Is Visible  ${searchBar}  ${project.get('prop', 'defaultTimeout')}

    # Se o nome deve ser retirado da lista, um será selecionado aleatoriamente.
    IF  '${inputName}' == '${project.get('customVariable', 'getFromList')}'
        ${length}    Get List Size
        ${item}      Get List Item By Index  ${{random.randint(1, ${length})}}
        
        ${textElem}  Get List Item Text Element  ${item}
        ${inputName}  Get Text  ${textElem}
    END
    
    Click Element  ${searchInput}
    Set Input Text  ${searchInput}  ${inputName}
    Click Go Back Button
    Click Element  ${searchBtn}

    ${length}  Get List Size

    IF  '${inputName}' == '${EMPTY}'
        # Se o texto inserido for vazio, o app apresenta a lista inteira.
        Should Not Be Equal As Integers  ${length}  0
    ELSE
        IF  ${validSearch}
            ${max}  Evaluate  ${length} + 1

            FOR  ${index}  IN RANGE  1  ${max}
                ${item}      Get List Item By Index      ${index}
                ${textElem}  Get List Item Text Element  ${item}

                Check Element Contains Text  ${textElem}  ${inputName}
            END
        ELSE
            Page Should Not Contain Element  ${listBase}
            Take Evidence
        END
    END