*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Enter Text
    [Arguments]    ${locator}   ${value}
    input text    ${locator}   ${value}

Click To Element
    [Arguments]    ${locator}
    click element    ${locator}

Select The Radio Button
    [Arguments]     ${locator}  ${value}
    select radio button     ${locator}  ${value}

Select Dropdown Value By Index
    [Arguments]     ${locator}  ${value}
    select from list by index   ${locator}  ${value}

Select Dropdown Value By Value
    [Arguments]     ${locator}  ${value}
    select from list by value   ${locator}  ${value}