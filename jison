create database apple;
-- database bana 
use apple;
-- database ko use kiya
create schema apple_schema;
-- ek schema banya kyuki ye proper trike se store kr ske
use schema apple_schema;

create or replace stage apple_stege;
-- satage banya gya thaki hm data ko store krne se pehle uspe porese kr skte 
desc stage apple_stege;

list@apple_stege;
-- jo hmene data 
select $1,$2,$3 from @apple_stege;

create or replace table table_1(detail variant);
-- yha hme data VARIANT bhnaya tanki hm json file ko read kr skte h 
copy into table_1 from @apple_stege
file_format =(type="json");
--  table me data copy krne ke liye copy comka use kiya
-- file format se hamne btaya ki kis type ki file h 
select * from table_1;

select detail:food,detail:oder_id,detail:price from table_1;
-- isme hame data ko liya detail se food colom ki detail 

create or replace table table_2(detail variant);

 copy into table_2 from @apple_stege/practical2.json
 file_format=(type='json');

 select detail[0]:food,detail[0]:oder_id,detail[0]:price,
 detail[1]:food,detail[1]:oder_id,detail[1]:price,
 detail[2]:food,detail[1]:oder_id,detail[2]:price,
 detail[3]:food,detail[3]:oder_id,detail[3]:price,
 
 
 from table_2;


 
create or replace table table_3(detail variant);

 copy into table_3 from @apple_stege/practical2.json
 file_format=(type='json' strip_outer_array=true);


select detail:food,detail:oder_id,detail:price from table_3;
