create database Assesment04Db
use Assesment04Db
--create product table
create table Products(
PId int primary key identity(500,1),
PName nvarchar(50) not null,
PPrice float,
Ptax as PPrice*0.10 persisted,
PCompany nvarchar(50),
PQty int default 10)

insert into Products(PName, PPrice, PCompany)values('Mobile', 49999, 'Redmi')
insert into Products(PName, PPrice, PCompany)values('Mobile', 19999, 'Realme')
insert into Products(PName, PPrice, PCompany)values('Laptop', 89999, 'Samsung')
insert into Products(PName, PPrice, PCompany)values('laptop', 49999, 'Redmi')
insert into Products(PName, PPrice, PCompany)values('Mobile', 29999, 'Xiaomi')
insert into Products(PName, PPrice, PCompany)values('Mobile', 15999, 'HTC')
insert into Products(PName, PPrice, PCompany)values('EarPod', 14999, 'Apple')
insert into Products(PName, PPrice, PCompany)values('Mobile', 89999, 'Apple')
insert into Products(PName, PPrice, PCompany)values('Macbook', 81999, 'Apple')
insert into Products(PName, PPrice, PCompany)values('EarPhone', 1999, 'Realme')
select * from Products
---------------------------------------
create proc product_details
with encryption
as
begin 
select
PId,
PName,
PPrice + PTax as priceWithTax,
PQty *(PPrice + PTax) as TotalPrice
from Products
end
exec product_details


create proc TotalTax
@PCompany nvarchar(100),
@TotalTax float output
with encryption
as
begin
select
@TotalTax=SUM(PTax)
from Products
where PCompany = @PCompany
end

declare @TotalTax float
exec TotalTax 'Apple', @TotalTax output
print 'Total Tax for Apple: ' + CONVERT(varchar, @TotalTax)

declare @TotalTax float
exec TotalTax 'Redmi', @TotalTax output
print 'Total Tax for Redmi: ' + CONVERT(varchar, @TotalTax)

declare @TotalTax float
exec TotalTax 'Realme', @TotalTax output
print 'Total Tax for Realme: ' + CONVERT(varchar, @TotalTax)

declare @TotalTax float
exec TotalTax 'Xiaomi', @TotalTax output
print 'Total Tax for Xiaomi: ' + CONVERT(varchar, @TotalTax)

declare @TotalTax float
exec TotalTax 'HTC', @TotalTax output
print 'Total Tax for HTC: ' + CONVERT(varchar, @TotalTax)