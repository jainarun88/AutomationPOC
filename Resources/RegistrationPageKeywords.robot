*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/LoginPageLocators.py
Library    SeleniumLibrary
Variables    ../PageObjects/RegistrationPageLocators.py
Resource    ../Resources/GenericKeywords.robot

*** Keywords ***
Click To Regiser Link
    Click To Element    ${lnk_register}

Registar Page Should Be Visible
    page should contain    Register

Select Gender
    [Arguments]     ${gender}
    Select The Radio Button    Gender  ${gender}

Enter First Name
    [Arguments]    ${firstName}
    Enter Text    ${txt_firstName}  ${firstName}

Enter Last Name
    [Arguments]    ${lastName}
    Enter Text    ${txt_lastName}  ${lastName}

Select Date
    [Arguments]    ${day}   ${month}    ${year}
    Select Dropdown Value By Index   ${dd_day}   ${day}
    Select Dropdown Value By Index   ${dd_month}   ${month}
    Select Dropdown Value By Value  ${dd_year}   ${year}

Enter Email
    [Arguments]    ${email}
    Enter Text    ${txt_email}  ${email}

Enter Company Name
    [Arguments]    ${company}
    Enter Text    ${txt_company}  ${company}

Enter Password
    [Arguments]    ${password}
    Enter Text    ${txt_password}  ${password}

Enter Confirm Password
    [Arguments]    ${confirmPassword}
    Enter Text    ${txt_confirmPassword}  ${confirmPassword}

Click To Register Button
    Click To Element    ${btn_register}

Verification Text Available On The Page
    page should contain    Your registration completed