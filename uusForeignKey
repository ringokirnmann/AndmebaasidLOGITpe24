CREATE TABLE opetaja(
opetajaId int Primary Key identity(1,1),
eesnimi varchar(25),
perekonnanimi varchar(30) NOT null,
ruum int)

INSERT INTO opetaja
VALUES ('Tiiu', 'Bogdanovich', '232')

select * from opetaja

INSERT INTO opetaja
VALUES ('Roman', 'Bellic', '112'),
('Marko', 'Lember', '211')

CREATE TABLE Opetamine(
OpetamineId int Primary Key identity(1,1),
opetajaId int,
Foreign Key (opetajaId) References opetaja(opetajaId),
oppeaine varchar(25),
maht int);
Select * from opetaja;
select * from Opetamine;

INSERT INTO Opetamine
VALUES (3, 'Kokkamine', 120),
(4, 'Programmeerimine', 400),
(2, 'Eesti keel', 240)
