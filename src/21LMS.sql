create type Gender as enum ('Female','Male');
create type Genre as enum ('DETECTIVE','DRAMA','HISTORY','ROMANS','BIOGRAPHY','FANTASY');



alter table languages
    alter column language set not null;


alter table books
    add language_id int references languages (id);
alter table books
    add publisher_id int references publishers (id);
alter table books
    add author_id int references authors (id);


alter table authors
    add constraint unique_email unique (email);



--1--
select name, published_year, genre
from books;
--2--
select distinct country
from authors;
--3--
select *
from books
where published_year between '1/1/2020' and '30/12/2023';
--4--
select name
from books
where genre = 'DETECTIVE';
--5--
select concat(first_name, ' ', last_name) as author
from authors;
--6--
select concat(first_name, ' ', last_name) as author
from authors
where country = 'France'
   or country = 'Germany'
order by first_name;
--7--
select name, country, published_year, price, genre
from books
where price < 500
  and genre not in ('ROMANS');
--8--
select *
from authors
where gender = 'Female'
    limit 3;
--9--
select *
from authors
where first_name like '____'
  and email like '%.com'
  and gender = 'Female';
--10--
select country, count(country) > 2
from authors
group by country;
--11--
select country, count(country)
from authors
group by country
having count(country) = 3
order by country;
--12--
select genre, count(genre)
from books
group by genre;
--13--
select *
from books
where genre in ('DETECTIVE', 'ROMANS')
order by price asc
    limit 2;
--14--
select count(*) as histoyCount, count(*) as biology
FROM books
where genre = 'HISTORY'
   or genre = 'BIOGRAPHY';
--15--
select p.name as booksName, a.first_name as authourName, l.language
from books b
         join publishers p on b.publisher_id = p.id
         join authors a on b.author_id = a.id
         join languages l on b.language_id = l.id;

--16--
select concat(a.first_name, ' ', a.last_name),
       a.email,
       a.date_of_birth,
       a.country,
       a.gender,
       p.name as publisher
from books b
         join authors a on b.author_id = a.id
         join publishers p on b.publisher_id = p.id;
--17--
select concat(a.first_name, ' ', a.last_name) as author_name, b.name as author_book
from books b
         join authors a on b.author_id = a.id;
--18--
select language, count(l.id) as count_of_books
from books b
    left join languages l on b.language_id = l.id
group by l.id, language
order by count_of_books desc;
--19--
select p.name, round(avg(price)) as avgColumn
from books b
         join publishers p on b.publisher_id = p.id
group by p.name
order by avgColumn;
--20--
select b.name, concat(a.first_name, ' ', a.last_name)
from books b
         join authors a on b.author_id = a.id
where published_year > '1/1/2010'
  and published_year < '30/12/2015';
--21--
select concat(a.first_name, ' ', a.last_name), sum(price) as prices
from books b
         join authors a on b.author_id = a.id
where published_year > '1/1/2010'
  and published_year < '30/12/2015'
group by a.id
order by prices;
