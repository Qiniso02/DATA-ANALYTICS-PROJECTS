/*Creating database named SalesDB1*/
create database SalesDB1;

/*3.1 Adding a profit column to the sales table and populate it*/
Alter Table dbo.Sales51
Add Profit decimal(18,2)
/*3.2 Populating the added column in the dbo.Sales51*/
update dbo.Sales51
set Profit = Sales - Cost

/*4.1 Using the tables to create the report of total sales per product*/
select Product_ID, 
sum(Sales) AS Total_Salea 
from dbo.Sales51
group by Product_ID;

/*4.2 Using the tables to create the report of total profit per state*/
select r.State, 
sum(s.Profit) as Total_Profit 
from dbo.Sales51 as s 
 inner join dbo.Regions91 as r 
on s.Place_ID = r.Place_ID
group by r.State;

/*4.3 Using the tables to create the report of total sales by state*/
select r.state,
sum(s.Sales) as Total_Sales
from dbo.Sales51 as s
join dbo.Regions91 as r
on s.Place_ID = r.Place_ID
group by r.State;

/*4.4 Using the tables to create the report of sales by categort*/
select
s.Sales,
p.Category
from dbo.Sales51 as s
join dbo.Products81 as p
on s.Product_ID = p.Product_ID
group by p.Category, s.Sales;

/*4.5 Using the tables to create the report of total units sold per product*/
select
p.Product_ID,
sum(s.Quantity) as Total_NR_Units
from
dbo.Sales51 as s
join dbo.Products81 as p
on s.Product_ID = p.Product_ID
group by p.Product_ID;

/*5 Displaying the product id, product name and sales for the product that has the highest profit*/
select 
p.Product_ID,
p.Product_Name,
s.Sales
from dbo.Sales51 as s
join dbo.Products81 as p
on s.Product_ID = p.Product_ID
order by s.Profit desc;

/*6 Fetching all sales records that registered a profit more than 1500000*/
select * from dbo.Sales51 where Profit > 1500000;

/*7 Showing all products that belong to the furniture category*/
select * from dbo.Products81 where Category = 'Furniture';

/*8 Displaying the sale id,product name and the sales for the products that have the letter 'lu' anywhere in the product name*/
select
s.Sales_ID,
p.Product_Name,
s.Sales
from dbo.Sales51 as s
join dbo.Products81 as p
on s.Product_ID = p.Product_ID
where p.Product_Name like '%LU%';

/*9 Given any product id, remove the product from the product table*/
delete from dbo.Products81
where Product_ID = 'FUR-BO-10001798';

/*10 Changing the name global deluxe stacking chair, gray in the product table to coffee table deluxe*/
update dbo.Products81
set Product_Name = 'Coffee Table Deluxe'
where Product_Name = 'Global Deluxe Stacking Chair, Gray';

/*11 Changing the name of the column state in the regions table to region*/
update dbo.Regions91
set State = 'Region'
where  State = 'State';




select * from dbo.Sales51;
select * from dbo.Products81;
select * from dbo.Regions91;
select * from dbo.Orders71;