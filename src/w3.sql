--1--
SELECT DISTINCT City FROM Customers;
--part 2 --
SELECT distinct CustomerName,City from Customers group by City;
--2--
SELECT * FROM Employees WHERE BirthDate<'1960-12-31' AND BirthDate>'1950-01-01';
--3--
SELECT ContactName,City FROM [Suppliers] where Country='France';
--4--
select * from Customers where  Country not in ('Italy') and CustomerName like ('A%');
--5--
select * from Customers where  PostalCode='';
--6--
select * from Customers where City='London' limit 2;
--7--
select FirstName,LastName,BirthDate from Employees where LastName like ('____');
--8--
select SupplierName,Country,count(Country) from Suppliers group by Country ;
--9--
select SupplierName,Country,count(Country)<2 from Suppliers group by Country ;
--10--
select CategoryName, count(CategoryName)
    as Prodyct_count from Products
        inner join Categories c on Products.CategoryID=c.CategoryID
                     group by CategoryName
                     order by CategoryName;
--11--
select min(Price),ProductName from Products where CategoryID=6 or CategoryID=8;
--12--
select p.ProductName,s.SupplierName from Products p join Suppliers s on p.ProductID=s.SupplierID group by SupplierName;
--13--
select SupplierID, count(*)
    as countOFProduct from Products group by SupplierID
                                    order by countOFProduct desc;
--14--
select CustomerName,FirstName,ShipperName
from Orders o join Customers c on o.CustomerID=c.CustomerID
    join Employees e on o.EmployeeID=e.EmployeeID
    join Shippers s on o.ShipperID=s.ShipperID;
--15--
select EmployeeID, count(distinct CustomerID)
    as countOFcustomers from Orders group by EmployeeID;