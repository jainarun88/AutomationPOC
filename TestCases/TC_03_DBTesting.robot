*** Settings ***
Resource    ../Library.robot
Resource    ../Resources/DBCommonKeywords.robot

Suite Setup       Connect DB
Suite Teardown    Disconnect DB

#*** Variables ***
#${DBName}   mydb
#${DBUser}   root
#${DBPass}   Test@123
#${DBHost}   127.0.0.1
#${DBPort}   3306

*** Test Cases ***
#Insert Records in Person Table
#    #Inserting Multiple Record in Table  TestData/mydb_person_table_insert_data.sql
#    Inserting Single Record in Table    ${insertSingleRecord}

Check Om record present in Person Table
    Check If Exists In Database     select id from mydb.person where first_name="Om";

Retrive Single Record
    ${name}=    Retrive Single Record From The Table    ${personTable}     id      ${personTableFirstNameCol}   'Arun'

#Check Jio record is not present in Person Table
#    Check If Not Exists In Database     select id from mydb.person where first_name="Jio";
#
#Check Person Table exists in mydb database
#    Table Must Exist    person
#
#Verify Row count is Zero
#    Row Count Is 0     Select * From mydb.person where first_name='Jio';
#
#Verify Row count is equal to some value
#    Row Count Is Equal To X     Select * From mydb.person where first_name='Karan';  2
#
#Verify Row count is Greater then some value
#    Row Count Is Greater Than X     Select * From mydb.person where first_name='Karan';  1
#
#Verify Row count is Less then some value
#    Row Count Is Less Than X     Select * From mydb.person where first_name='Karan';  5
#
#Update record in Person Table
#     ${output}=  execute sql string    Update mydb.person set id=107 where first_name='Jay';
#     log to console    ${output}
#     should be equal as strings    ${output}     None
#
#Retrive Records from Person Table
#    @{rocordSets}=   Query  select * from mydb.person;
#    log many    @{rocordSets}
#
#    ${data}=    Retrive Single Record From The Table    mydb.person     id      first_name      'Om'
#    ${data}=    Data Trim   ${data}
#    log    ${data}
#    log to console    ${data}

#Delete Record From The Table
#     ${output}=     execute sql string    Delete from mydb.person;
#     log to console    ${output}
#     should be equal as strings    ${output}     None


#Create Person Table
#    ${output}=  execute sql string    Create table person(id integer,first_name varchar(20),last_name varchar(20));
#    log to console    ${output}
#    should be equal as strings    ${output}     None

#Inserting Data in Person Table
#    # Insert Single Record
#    # ${output}=  execute sql string    Insert into person values(101,"Arun","Jain");
#
#    # Insert Multiple Record
#    ${output}=     execute sql script    TestData/mydb_person_table_insert_data.sql
#    log to console    ${output}
#    should be equal as strings    ${output}     None
