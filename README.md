# AndmebaasidLOGITpe24
Andmebaasiga seotud sql kood ja konspektid
---
- SQL - Structured Query Language - Struktureeritud päringu keel
- DDL - Data Definition Language - Andmebaasi struktuuri loomiseks - CREATE, ALTER
- DML - Data Manipulation Language - Andmete lisamine ja uuendamine tabelisse - INSERT, UPDATE, DELETE
---
## Sisukord
- [Andmebaasihaldussüsteemid](#-andmebaasihaldussüsteemid)
- [Põhimõisted](#-Põhimõisted)
- [Andmetüübid](#-Andmetüübid)
- [Piirangud](#-Piirangud)
- [Seosed](#-Tabelivahelised)

---
### Tunnis me kasutame andmebaasihaldussüsteemid:
---
1. SQL Server Management Studio (SQL Serveri haldamiseks)
---

<img width="550" height="569" alt="{DBF9C8F8-377D-41DC-BF4C-219C0879E7B0}" src="https://github.com/user-attachments/assets/440c5a82-d783-43a5-a087-1241bf4d2a51" />

---
3. XAMPP -phpmyAdmin (mariaDB andmebaas) - vabavara
---
## Põhimõisted
---
- Andmebaas - Infokogum mis sisaldab infot nt telefoniraamat (struktureeritud andmete kogum)
- Tabel - olem (entity)
- Veerg - väli (field)
- Rida - kirje (record)
- Primaarne võti -PK-Primary Key - veerg (tavaliselt nimega id) unikaalse identifikaatoriga mis eristab iga kirjet
- Välisvõti (võõrvõti) -FK-Foreign Key - veerg, mis loob seose teise tabeli primaarvõtmega
---
## Andmetüübid
---
- INT, float, decimal(6,2) - numbrilised
- varchar(50), char(6) - tekst/sümbolid
- boolean, bool, bit - loogiline tüüp
- date, time, datetime - kuupäevad
---
## Piirangud
---
1. Primary Key
2. Foreign key
3. Unique
4. Not Null
5. Check
---
## Tabelivahelised seosed
---
- Üks - ühele (nt mees --naine)
- Üks - mitmele (õpilane käib erinevates õppeainetes)
- - Mitu - mitmele (nt õpilane - õpetaja)

  <img width="873" height="366" alt="{B7114448-2965-4A96-9A7A-38744F7448E3}" src="https://github.com/user-attachments/assets/f8cbfe0f-d37b-4858-b96a-8f3bb376f907" />

## Stored procedure
salvestatud protseduurid - sama mis on funktsioonid programmeerimises - mingi tegevus(ed), mida saab automaatselt teha (INSERT, SELECT, UPDATE, DELETE)
```sql
--protseduur, mis täidab tabeli
CREATE PROCEDURE lisaKategooria
@nimi varchar(15)
AS
BEGIN
	INSERT INTO categories
	VALUES (@nimi)
	SELECT * FROM categories;
END
--kutse
EXEC lisaKategooria 'test';

--protseduur, mis kustutab tabelist id järgi
create procedure kustutaIdJargi
@id int
AS
BEGIN
	SELECT * FROM categories;
	DELETE FROM categories WHERE category_id=@id;
	SELECT * FROM categories;
END
--kutse
EXEC kustutaIdJargi '3';

--otsing
--protseduur mis otsib kõik kategooriad sisestatud 1 tähte järgi
CREATE PROCEDURE otsing1taht
@taht char(1)
AS
BEGIN
	SELECT category_name FROM categories
	WHERE category_name LIKE @taht + '%';
END
-- kutse
EXEC otsing1taht 'r';

--protseduur, mis uuendab nimed sisestatud id jargi
CREATE PROCEDURE uuendaKategooria
@id int,
@uuendatudNimi varchar(20)
AS
BEGIN
	SELECT * FROM categories;
	UPDATE categories SET category_name=@uuendatudNimi
	WHERE category_id=@id;
	SELECT * FROM categories;
END
--kutse
EXEC uuendaKategooria 4, 'jope'
```
---
