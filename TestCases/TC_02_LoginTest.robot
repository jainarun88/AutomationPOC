*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/LoginPageKeywords.robot

*** Variables ***
${url}  https://demo.nopcommerce.com/
${browser}  chrome

*** Test Cases ***
LoginTest
    Open My Browser    ${url}   ${browser}
    Login To Application
    #Dashboard Page Should Be Visible
    close my browser

*** Keywords ***
Login To Application
    [Documentation]    This Keyword is related to Login to the Application
    Navigate To Login Page
    Input Email    arun.jain.vit@gmail.com
    Input Password    psppa111
    Click To Login Button