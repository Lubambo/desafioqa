*** Settings ***
Documentation  Mapeamento dos elementos da tela Lista.

Library  String
Library  AppiumLibrary

Variables  ${EXECDIR}/locators.py

*** Variables ***
&{formWelcomeText}       text=Marque as techs que usam Appium  locator=xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView[1]
${formSelectedListText}  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView[2]

# Lista de registros
${listBase}      xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup
${listItemBase}  ${listBase}/android.view.ViewGroup

*** Keywords ***
Mount Expected Selected Options List Text
    [Arguments]  ${option1}  ${option2}
    ${baseText}  Set Variable  Selecionados:
    ${option1}  Convert To Title Case  ${option1}
    ${option2}  Convert To Title Case  ${option2}
    ${expectedText}  Set Variable  ${baseText} ${option1},${option2}
    [Return]  ${expectedText}

Get List Item By Index
    [Arguments]  ${index}
    ${item}  Catenate  SEPARATOR=  ${listItemBase}  [  ${index}  ]
    [Return]  ${item}

Get All List Items
    ${itemXpath}  Get List Item By Index  1
    @{items}  Get Webelements  ${itemXpath}
    [Return]  ${items}

Get List Item CheckBox Element
    [Arguments]  ${itemLocator}
    ${checkBoxElement}  Set Variable  ${itemLocator}/android.widget.CheckBox
    [Return]  ${checkBoxElement}

Get List Item Text Element
    [Arguments]  ${itemLocator}
    ${textElement}  Set Variable  ${itemLocator}/android.widget.CheckBox/android.widget.TextView[2]
    [Return]  ${textElement}

Get List Size
    ${xpath}  Get Substring  ${listBase}  6
    ${count}  Get Matching Xpath Count  ${xpath}
    
    IF  ${count} > 0
        ${xpath}  Get Substring  ${listItemBase}  6
        ${count}  Get Matching Xpath Count  ${xpath}
    END
    
    [Return]  ${count}

Select Option By Text
    [Arguments]  ${text}
    ${size}  Get List Size
    ${max}    Evaluate  ${size} + 1

    FOR  ${index}  IN RANGE  1  ${max}
        ${item}      Get List Item By Index  ${index}
        ${item}      Get List Item Text Element  ${item}
        ${itemText}  Get Text  ${item}

        ${text}      Convert To Lower Case  ${text}
        ${itemText}  Convert To Lower Case  ${itemText}

        IF  '${itemText}' == '${text}'
            Click Element  ${item}
            Exit For Loop
        END
    END

Count Items By Check Status
    [Arguments]  ${status}=${True}
    ${size}   Get List Size
    ${max}    Evaluate  ${size} + 1
    ${count}  Set Variable  0

    FOR  ${index}  IN RANGE  1  ${max}
        ${item}      Get List Item By Index  ${index}
        ${checkbox}  Get List Item CheckBox Element  ${item}
        ${checked}   Get Element Attribute  ${checkbox}  checked
        ${checked}   Convert To Boolean  ${checked}

        IF  ${checked} == ${status}
            ${count}  Evaluate  ${count} + 1
        END
    END

    [Return]  ${count}
    
Count Selected Items
    ${count}  Count Items By Check Status  ${True}
    [Return]  ${count}

Count Not Selected Items
    ${count}  Count Items By Check Status  ${False}
    [Return]  ${count}