*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/LoginPageLocators.py
Resource    ../Resources/GenericKeywords.robot

*** Keywords ***
Open My Browser
    [Arguments]    ${url}      ${browser}
    open browser    ${url}      ${browser}
    maximize browser window

Close My Browser
    close all browsers

Navigate To Login Page
    Click To Element    ${lnk_login}

Input Email
    [Arguments]    ${email}
    input text    ${txt_emailPass}    ${email}

Input Username
    [Arguments]    ${username}
    input text    ${txt_loginUsername}    ${username}

Input Password
    [Arguments]    ${password}
    input text    ${txt_loginPassword}    ${password}

Click To Login Button
    click element    ${btn_login}

Click To Logout Button
    click element    xpath://a[contains(text(),'Logout')]

Error Message Should Be Visible
    page should contain    Invalid credentials

Dashboard Page Should Be Visible
    page should contain    Dashboard