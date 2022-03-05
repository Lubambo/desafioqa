*** Settings ***
Documentation  Page Object contendo o mapeamento da página de Busca do Guia Médico.

*** Variables ***
${guiaMedicoTitle}    Guia Médico - Site Institucional

# Busca avançada
${advancedSearchBtn}  id:react-tabs-2
${doctorNameInput}    css:#react-tabs-3 > form > div > div:nth-child(3) > div:nth-child(2) input
${specialtyInput}     id:react-select-3-input
${stateSelect}        id:react-select-4-input
${searchBtn}          css:#react-tabs-3 > form > div > div:nth-child(6)  button