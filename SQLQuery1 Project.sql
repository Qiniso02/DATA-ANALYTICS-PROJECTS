/*1 Creating a bank database called DevBank*/
create database DevBank;

/*2 The banks record of its banking clients in the database in a relation named ClientRecords*/
create table ClientRecords (
account_number int primary key,
first_name varchar(50),
surname varchar(50),
account_type varchar(50),
client_address varchar(100),
account_balance float,
);

/*3 Capture records of 5 clients into the bank database*/
insert into ClientRecords values
(10000001, 'Yoliswa', 'Bhengu', 'Savings', '01 Kwaxa Road', 1000.23),
(10000002, 'Patience', 'Magubane', 'Cheque', '02 Kwaxa Road', 3500.78),
(10000003, 'Asiphile', 'Zuma', 'Student', '03 Kwaxa Road', 1600.45),
(10000004, 'Lubanzi', 'Rashford', 'Fixed Deposit', '04 Kwaxa Road', 100500.53),
(10000005, 'Charity', 'Ngubane', 'Business', '05 Kwaxa Road', 250000.10);

/*4 The bank branches all over RSA has the following details kept in a relation called Branches*/
create table Branches (
branch_code varchar(50) primary key,
branch_name varchar(50),
branch_manager varchar(50),
branch_address varchar(50),
city varchar(50),
region varchar(50),
);

/*5 Capture the details of 5 branches into the database*/
insert into Branches values
('strd101', 'Standard Bank Central Durban', 'Thabo Mthembu', '01 West Smith Road', 'Durban', 'KwaZulu-Natal'),
('cpt102', 'Capitec Sandton', 'Khocy Mbovu', '02 Rivonia Road', 'JHB', 'Gauteng'),
('ndb103', 'Nedbank Cape Town', 'Amanda Zuma', 'Unit 2 Victoria Road', 'Cape Town', 'Western Cape'),
('fnb104', 'First National Bank Gqeberha', 'Lizzy Groorboom', '88 Govan Mbeki Avenue', 'Gqeberga', 'Eastern Cape'),
('absa105', 'African National Bank Bloemfontein Mall', 'Ayanda Mkhize',  '5 Mimosa Mall Road', 'Bloemfotein', 'Free State');

/*6 Captures all transactions into table called Trans*/
create table Trans (
transaction_code int primary key,
account_number int,
branch_code varchar(50),
transaction_type varchar(50),
amount float,
);

/*7 Capture 10 transaction using Trans table*/
insert into Trans values
 (001,10000001, 'SB101', 'Deposit', 5000.00),
 (002,10000002, 'SB102', 'Withdrawal', 1200.50),
 (003,10000003, 'FNB103', 'Transfer', 3500.00),
 (004,10000004, 'FNB104', 'Deposit', 7800.75), 
 (005,10000005, 'ABSA105', 'Payment', 450.00),
 (006,10000006, 'ABSA106', 'Withdrawal', 2000.00), 
 (007,10000007, 'CAP107', 'Deposit', 1500.00), 
 (008,10000008, 'CAP108', 'Transfer', 2200.40), 
 (009,10000009, 'NED109', 'Deposit', 10000.00), 
 (010,10000010, 'NED110', 'Withdrawal', 650.25); 

 /*8 Add a date attribute to Trans table*/
 alter table Trans
 add trans_date date;

 /*9 Update the transaction date for the 10 transactions in Q7*/
 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 1;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 2;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 3;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 4;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 5;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 6;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 7;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 8;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 9;

 update Trans
 set trans_date = '2026-07-01'
 where transaction_code = 10;

 /*10 Display all clients showing their account number, name,surname and account balance*/
 select account_number, first_name, surname, account_balance from ClientRecords; 

 /*11 Display all branches showing the branch code, branch name and city*/
 select branch_code, branch_name, city from Branches;

 /*12 Display records of all transactions shoeing the branch code, account number, transaction type, date, amount*/
 select branch_code,
 account_number,
 transaction_type as transaction_classification,
 trans_date as date,
 amount
 from Trans;
 /*13 display only unique transaction*/
 select distinct * from Trans;

 /*14 Given an account number, show a transaction captured for that client showing account number,branch code, branch name,
 transaction classification,date and amount*/
 select t.branch_code,
 b.branch_name,
 t.transaction_type as transaction_classification,
 trans_date as date,
 t.amount
from Trans as t,Branches as b
where t.account_number = 10000001; 

/*15 Show all transactin record in ascending order of account number*/
select * from Trans order by account_number asc;




select * from ClientRecords;
select * from Branches;
select * from Trans;