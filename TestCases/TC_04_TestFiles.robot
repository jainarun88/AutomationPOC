*** Settings ***


*** Variables ***
${record}   failed
${errorCode}    123456
${errorMessage}     This is a error message


*** Test Cases ***
TC Run
    Validate "state" For "ASYNC_RESPONSE"


*** Keywords ***
Get DB Column "${col_name}" Data For "${type}"
#    ${record}   Success
    set global variable    ${record}

Validate "${state}" For "${type}"
    run keyword if    "${record}" == "Success"  String Equal Ignore Case    ${record}    Success
    ...    ELSE IF     "${record}" == "Failed" and "${type}" == "ASYNC_RESPONSE"    Async Response Error Code and Message   ${record}    Success
    ...    ELSE     Other Case

String Equal Ignore Case
    [Arguments]    ${str1}      ${str2}
    log    Actual and Expecte Result Pass Successfuly
    should be equal    ${str1}    ${str2}     ignore_case=True

Async Response Error Code and Message
    [Arguments]    ${str1}      ${str2}
    log    Actual and Expecte Result Faild due to ERROR CODE = ${errorCode} and ERROR MESSAGE = ${errorMessage}
    should be equal    ${str1}    ${str2}     ignore_case=True

Other Case
    log    This is Othe Case


Get Error Code from response1
    ${value}    convert to string
    run keyword if    "${value}" == "null"    Test Keyword1   ${value}
    ...    ELSE IF    "${value}" != "null"  Test Keyword2    ${value}

Get Error Message from response1
    ${value}    convert to string
    run keyword if    "${value}" == "null"  Test Keyword1    ${value}
    ...    ELSE IF    "${value}" != "null"  Test Keyword2    ${value}

Test Keyword1
    [Arguments]    ${value}
    should be equal as strings    ${value}      null
    log    ${value}
    log to console    ${value}

Test Keyword2
    [Arguments]    ${value}
    should not be equal as strings    ${value}      null
    log    ${value}
    log to console    ${value}

