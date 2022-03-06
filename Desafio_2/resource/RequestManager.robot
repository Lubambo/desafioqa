*** Settings ***
Documentation  Interface to manage HTTP request validations.

Library   RequestsLibrary
Library   Collections
Library   String

Resource  ./json/JsonUtils.robot

*** Keywords ***
Create Movie Id Endpoint Url
    [Arguments]  ${movieId}
    ${url}  Set Variable  ${project.get('prop', 'BASE_URL')}&i=${movieId}
    [Return]  ${url}

Check Status Code
    [Arguments]  ${response}  ${expectedStatusCode}
    Should Be Equal As Strings  ${response.status_code}  ${expectedStatusCode}
    
Check Header
    [Arguments]  ${response}  ${key}  ${expectedValue}
    Dictionary Should Contain Item  ${response.headers}  ${key}  ${expectedValue}

Check Body Item
    [Arguments]  ${content}  ${key}  ${expectedValue}
    Dictionary Should Contain Item  ${content}  ${key}  ${expectedValue}

Check Response
    [Arguments]  ${response}  ${expectedStatusCode}  ${expectedHeaders}  ${expectedSchema}  ${expectedBodyValues}

    Check Status Code  ${response}  ${expectedStatusCode}

    FOR  ${header}  IN  @{expectedHeaders}
        Check Header  ${response}  ${header.key}  ${header.value}
    END

    ${schema}  Read JSON file  ${expectedSchema}
    Check Json Schema  ${response.json()}  ${schema}

    FOR  ${item}  IN  @{expectedBodyValues}
        Check Body Item  ${response.json()}  ${item.key}  ${item.value}
    END