--1--
select brand,model,price from cars;
--2--
select count(*)from cars;
--3--
select * from cars where brand='Hyundai';
--4--
select * from cars where color in ('Red', 'Blue');
--5--
select * from cars where year_of_issue<2010 and year_of_issue>2000 ;
--6--
select count(brand = 'Chevrolet') from cars ;
--7--
select avg(year_of_issue) from cars;
--8--
select * from cars where brand in ('Audi','Toyota','Kia','Ford');
--9--
select * from cars where model like ('T%');
--10--
select * from cars where model like ('%e');
--11--
select * from cars where brand like ('_____');
--12--
select count(*) from cars where brand= ('Mercedes-Benz');
--part 2--
select sum(price) as sum from cars where brand=('Mercedes-Benz');
--13--
select min(price), max(price)from cars;
--14--
select * from cars where brand not in ('Toyota');
--15--
select brand,price from cars order by price desc limit 10;
--16--
select * from cars order by year_of_issue desc limit 10 offset 4;
--17--
select * from cars where not (year_of_issue>1995 and year_of_issue<2005);
--18--
select color, count(*) as counter
from cars
group by color
having count(*) = (select max(counter)
                   from (select color, count(*) as counter
                         from cars
                         group by color)as CountTable);
--самый ужасный 18--