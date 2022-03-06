*** Settings ***
Documentation  Resource to deal with JSON operations.

Library  OperatingSystem
Library  ./JsonUtils.py

*** Keywords ***
Read JSON file
    [Documentation]  Read a json file.
    [Arguments]  ${filePath}
    
    ${file}  GET FILE  ${filePath}
    ${json}  Evaluate  json.loads('''${file}''')  json

    [Return]  ${json}

Check Json Schema
    [Documentation]  Validate the json schema.
    [Arguments]  ${json}  ${schema}

    ${isValid}  Compare Json Schema  json=${json}  schema=${schema}
    Should Be True  ${isValid}