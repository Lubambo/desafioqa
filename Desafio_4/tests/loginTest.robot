*** Settings ***
Documentation  Verifica se as regras de login estão sendo impostas.
Default Tags  all  login

Library   DataDriver  ${EXECDIR}/data/loginTest.csv  dialect=excel-tab

Resource  ${EXECDIR}/resource/AppSessionManager.robot
Resource  ${EXECDIR}/resource/ElementsManager.robot
Resource  ${EXECDIR}/resource/AppAccess.robot
Resource  ${EXECDIR}/resource/Utils.robot

Resource  ${EXECDIR}/pageObjects/Login.robot
Resource  ${EXECDIR}/pageObjects/Home.robot

Suite Setup     Open Session
Suite Teardown  Close Session

Test Setup     Launch Application
Test Teardown  Quit Application

Test Template  Template Keyword

*** Test Case ***
Login ${testDescription}

*** Keywords ***
Template Keyword
    [Arguments]  ${validLogin}  ${user}  ${password}  ${testDescription}
    
    App Login  ${user}  ${password}

    IF  ${validLogin}
        Check Element Contains Text  ${homeWelcomeText.locator}  ${homeWelcomeText.text}
    ELSE
        Check Element Contains Text  ${alertText.locator}  ${alertText.text}
    END

    Take Evidence