create database autoyl

use autoyl

create table autod(
id int identity (1,1) PRIMARY KEY,
mark varchar(30),
regnr varchar(20),
aasta int,
regpiirk int)

insert into autod values('Audi', '123ABC', '2000', '1')
insert into autod values('Ford', '777AAA', '1988', '2')
insert into autod values('Ford', 'FIN772', '2002', '1')
insert into autod values('Nissan', '111CCC', '2006', '1')
insert into autod values('Toyota', '128HGF', '2003', '1')
insert into autod values('VAZ', '544CCH', '1960', '2')
insert into autod (mark, regnr, aasta, regpiirk) values ('Jeep', '6dz198', 1994, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Jeep', 'R9j331', 2009, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Lamborghini', 'rMt506', 1991, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Mazda', 'Iyw856', 2000, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Ford', 'w7N414', 2002, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Ford', 'EpY257', 2000, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Daewoo', '8hw407', 2000, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Dodge', 'D8e123', 1998, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Mazda', 'oJk091', 2007, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Mitsubishi', 'MpM246', 1994, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Pontiac', '7pQ637', 1997, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Kia', '610050', 2013, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Mercury', 'vrS188', 2000, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Aston Martin', 'imZ790', 2005, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Oldsmobile', 'qCu855', 1999, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Dodge', 'gFC982', 1999, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Ford', '9pS494', 2000, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Acura', 'ZX0838', 1999, '1');
insert into autod (mark, regnr, aasta, regpiirk) values ('Mercedes-Benz', 'Joy733', 1977, '2');
insert into autod (mark, regnr, aasta, regpiirk) values ('Mazda', 'jnD040', 1985, '1');

select * from autod
--1 select
select mark, regnr, aasta, regpiirk
from autod
order by aasta DESC;
--2 select
select DISTINCT mark from autod
--3 select
select regnr from autod
where aasta < 1993;
--4 select
select regnr from autod
where aasta < 1993
ORDER by regnr ASC;
--5 select
select MIN(aasta) as varaseim_aasta from autod
--6 select
UPDATE autod
set regnr = '333 KKK'
where id = 3;
select * from autod
--7 select
DELETE from autod
where id = 4;
--8 select
insert into autod values ('Nissan', '555NNN', '2007', '2')
--1 oma select
Select * from autod
where mark = 'Ford' and aasta < 2000;
--2 oma select
Select regpiirk, count(*) as arv_autosid
FROM autod
group by regpiirk;
--3 oma select
Select * from autod
order by aasta asc;
--1 esimene protseduur
CREATE PROCEDURE JärjestaAutod
AS
BEGIN
    SELECT * 
	FROM autod
    ORDER BY aasta DESC;
END;
-- teine protseduur
CREATE PROCEDURE ErinevadMargid
AS
BEGIN
    SELECT DISTINCT mark
	FROM autod;
END;
-- kolmas protseduur
CREATE PROCEDURE VanadAutod
AS
BEGIN
    SELECT regnr 
	FROM autod
    WHERE aasta < 1993
    ORDER BY regnr ASC;
END;

EXEC JärjestaAutod
EXEC ErinevadMargid
EXEC VanadAutod
