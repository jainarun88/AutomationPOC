*** Settings ***
Resource    ../Library.robot

*** Variables ***
${createPersonTable}    Create table person(id integer,first_name varchar(20),last_name varchar(20));
${insertSingleRecord}   Insert into person values(102,"Om","Shanti");
${insertMultiRecord}    TestData/mydb_person_table_insert_data.sql
${deleteRecord}         Delete from ${personTable};
${updateRecord}         Update ${personTable} set id=107 where first_name='Jay';
${recordExist}          select id from ${personTable} where first_name="Om";
${recordNotExist}       select id from ${personTable} where first_name="Jio";
${tableName}            person
${rowCountZero}         Select * From ${personTable} where first_name='Jio';
${rowCountEqual}        Select * From ${personTable} where first_name='Karan';
${rowCountGreater}      Select * From ${personTable} where first_name='Karan';
${rowCountLess}         Select * From ${personTable} where first_name='Karan';