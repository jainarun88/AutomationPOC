*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginPageKeywords.robot
Resource    ../Resources/RegistrationPageKeywords.robot

*** Variables ***
${url}  https://demo.nopcommerce.com/
${browser}  chrome

*** Test Cases ***
Registration Test
    Open My Browser    ${url}   ${browser}
    Click To Regiser Link
    Registar Page Should Be Visible

    #Form Filling
    Select Gender    M
    Enter First Name    Arun
    Enter Last Name     Jain
    Select Date    8    4   1988
    Enter Email    arun.jain.vit@gmail.com
    Enter Company Name    company
    Enter Password    psppa111
    Enter Confirm Password    psppa111
    Click To Register Button
    sleep    2
    Verification Text Available On The Page
    close my browser