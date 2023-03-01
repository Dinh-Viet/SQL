create table Customer(
   Customer_id int not null primary key identity(1,1),
   Name nvarchar(50),
   City nvarchar(50),
   Country nvarchar(50),
   Phone nvarchar(50),
   Email nvarchar(50),
);
create table CustomerAccount(
   AccountNumber char(9) not null primary key,
   Customer_id int not null foreign key references Customer(Customer_id),
   Balance money not null,
   MinAccount money,
);
create table CustomerTransaction(
TransactionID int primary key not null,
AccountNumber char(9)foreign key references customerAccount(AccountNumber),
TransactionDate smalldatetime,
Amount money,
DepositorWithdraw bit
); 


--3
insert into Customer(Name,City,Country,Phone,Email)
values ('Nguyen Van An','Ha Noi','Viet Nam','09876543','nguyenan@gmail.com'),
('Nguyen Van B','Ha Noi','Viet Nam','09876545','vietdinh@gmail.com'),
('Dinh Doanh Viet','Ha Noi','Viet Nam','03533241999','vietdinh1172004@gmail.com')

select * from Customer;

insert into CustomerAccount(AccountNumber,Customer_id,Balance,MinAccount)
values ('15678999','1','50000','500'),
('000066', '2' , '150000' ,'500'),
('000044', '3' , '150000' ,'500');

select * from CustomerAccount;

insert into CustomerTransaction (TransactionID,AccountNumber,TransactionDate,Amount,DepositorWithdraw)
values 
(1,'0000055', '2021-10-12',200000, 1),
(1,'0000045', '2022-01-21',200000, 1),
(1,'0000075', '20202-09-27',200000, 1);
 select * from C

--4
SELECT *FROM Customer where City = 'Ha Noi';


--5 
select A.Name, A.phone , A.Email, C.AccountNumber, C.Balance from customer A
inner join customerAccount C on A.Customer_id = C.Customer_id;
--6
Alter table CustomerTransaction
add check ( Amount >0 and Amount <= 100000);
--7
CREATE VIEW CustomerTransaction
AS
SELECT C.Name, CA.AccountNumber, CT.TransactionDate, CT.Amount, CT.DepositorWithdraw
FROM Customer C
JOIN CustomerAccount CA
	ON C.Customer_id = CA.Customer_id
JOIN CustomerTransaction CT
	ON CA.AccountNumber = CT.AccountNumber;
GO
--



