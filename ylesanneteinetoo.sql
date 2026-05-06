create database ylesanne
use ylesanne

create table filmid (
id int identity (1,1) PRIMARY KEY,
pealkiri varchar(30),
produtsent varchar(50) NOT NULL,
aasta date,
hind money)

insert into filmid
VALUES ('Baaghi 4', 'Tiger Shroff', '2025-10-5','30'),
('The Great Wall', 'Matt Damon', '2019-02-24', '20'),
('Brawl in Cell Block 99', 'Craig Zahler', '2017-10-6', '50')

select * from filmid

--protseduur lisa film

CREATE PROCEDURE lisaFilm
@pealkiri varchar(30),
@produtsent varchar(50),
@aasta date,
@hind money
AS
BEGIN
    INSERT INTO filmid
    VALUES (@pealkiri, @produtsent, @aasta, @hind);
    SELECT * FROM filmid;
END

--test
EXEC lisaFilm 'testing', 'test', '1970-03-12', '50'

--protseduur uuenda hind

CREATE PROCEDURE uuendaHind
@id int,
@uuendatudHind money
AS
BEGIN
	SELECT * from filmid;
	UPDATE filmid SET hind=@uuendatudHind
	WHERE id=@id;
	SELECT * from filmid;
END
--test

EXEC uuendaHind 3, '40'

--select yl1 vaata kõike filme

select * from filmid

--select yl2 aastad kahanevad

select pealkiri, produtsent, aasta, hind
from filmid
order by aasta DESC;

--select yl3 produtsendi nimed tähestiku järjekorras

select pealkiri, produtsent, aasta, hind
from filmid
order by produtsent DESC;
