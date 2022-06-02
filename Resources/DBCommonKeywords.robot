*** Settings ***
Library    String
Library    DatabaseLibrary
Library    OperatingSystem
Resource    ../Library.robot

*** Keywords ***
Connect DB
    Connect To Database      pymysql     ${dbName}   ${dbUser}   ${dbPass}   ${dbHost}   ${dbPort}

Disconnect DB
    Disconnect From Database

Data Trim
    [Arguments]    ${data}
    ${data}=    Convert To String    ${data}
    ${data}=    remove string   ${data}     ((
    ${data}=    remove string   ${data}     ,),)
    [Return]    ${data}

Retrive Single Record From The Table
    [Arguments]    ${tableName}    ${col1}    ${col2}    ${value}
    ${data}=    Query   select ${col1} from ${tableName} where ${col2}=${value};
    ${data}=    Data Trim   ${data}
    log    ${data}
    log to console    ${data}
    [Return]    ${data}

Retrive Multiple Records from The Table
    [Arguments]    ${tableName}
    @{rocordSets}=   Query  select * from ${tableName};
    log many    @{rocordSets}

Create Table
    [Arguments]    ${query}
    ${output}=  execute sql string    ${query}
    log to console    ${output}
    should be equal as strings    ${output}     None

Inserting Single Record in Table
     #Insert Single Record
     [Arguments]    ${query}
     ${output}=  execute sql string    ${query}
     log to console    ${output}
     should be equal as strings    ${output}     None

Inserting Multiple Record in Table
    # Insert Multiple Record
    [Arguments]    ${query}
    ${output}=  execute sql string    TestData/mydb_person_table_insert_data.sql
    log to console    ${output}
    should be equal as strings    ${output}     None

Update record in Person Table
     ${output}=  execute sql string    Update mydb.person set id=107 where first_name='Jay';
     log to console    ${output}
     should be equal as strings    ${output}     None

Delete Record From The Table
    [Arguments]    ${query}
    ${output}=  execute sql string    ${query}
    log to console    ${output}
    should be equal as strings    ${output}     None

Check Om record present in Person Table
    Check If Exists In Database     select id from mydb.person where first_name="Om";

Check Jio record is not present in Person Table
    Check If Not Exists In Database     select id from mydb.person where first_name="Jio";

Check Person Table exists in mydb database
    Table Must Exist    person

Verify Row count is Zero
    Row Count Is 0     Select * From mydb.person where first_name='Jio';

Verify Row count is equal to some value
    Row Count Is Equal To X     Select * From mydb.person where first_name='Karan';  2

Verify Row count is Greater then some value
    Row Count Is Greater Than X     Select * From mydb.person where first_name='Karan';  1

Verify Row count is Less then some value
    Row Count Is Less Than X     Select * From mydb.person where first_name='Karan';  5