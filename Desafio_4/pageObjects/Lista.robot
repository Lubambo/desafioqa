*** Settings ***
Documentation  Mapeamento dos elementos da tela Lista.

Library  String
Library  AppiumLibrary

Variables  ${EXECDIR}/locators.py

*** Variables ***
${searchBar}     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup
${searchInput}   ${searchBar}/android.widget.EditText
${searchBtn}     ${searchBar}/android.view.ViewGroup
${clearTextBtn}  ${searchBar}/android.view.ViewGroup[2]

# Lista de registros
${listBase}      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup
${listItemBase}  ${listBase}/android.view.ViewGroup

*** Keywords ***
Get List Item By Index
    [Arguments]  ${index}
    ${item}  Catenate  SEPARATOR=  ${listItemBase}  [  ${index}  ]
    [Return]  ${item}

Get List Item Text Element
    [Arguments]  ${itemLocator}
    ${textElement}  Set Variable  ${itemLocator}/android.view.ViewGroup/android.widget.TextView[1]
    [Return]  ${textElement}

Get List Size
    ${xpath}  Get Substring  ${listBase}  6
    ${count}  Get Matching Xpath Count  ${xpath}
    
    IF  ${count} > 0
        ${xpath}  Get Substring  ${listItemBase}  6
        ${count}  Get Matching Xpath Count  ${xpath}
    END
    
    [Return]  ${count}