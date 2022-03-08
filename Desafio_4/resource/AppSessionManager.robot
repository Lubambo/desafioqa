*** Settings ***
Documentation  Gerencia a sessão do appium e dispositivo mobile.

Library  AppiumLibrary

Resource  ${EXECDIR}/pageObjects/Login.robot

Variables  ${EXECDIR}/locators.py

*** Keywords ***
Open Session
    Open Application  ${project.get('prop', 'host')}
    ...               automationName=${project.get('prop', 'automationName')}
    ...               platformName=${project.get('prop', 'platformName')}
    ...               deviceName=${project.get('prop', 'deviceName')}
    ...               app=${EXECDIR}/${project.get('prop', 'app')}
    ...               udid=${project.get('prop', 'udid')}
    ...               systemPort=${project.get('prop', 'systemPort')}

    # Valida se o app realmente iniciou a sessão na página de login.
    Wait Until Page Contains  ${loginWelcomeText}  ${project.get('prop', 'defaultTimeout')}
    Page Should Contain Text  ${loginWelcomeText}

Close Session
    Close Application