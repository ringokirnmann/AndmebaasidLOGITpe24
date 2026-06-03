# AndmebaasidLOGITpe24
Andmebaasiga seotud sql kood ja konspektid
---
- SQL - Structured Query Language - Struktureeritud päringu keel
- DDL - Data Definition Language - Andmebaasi struktuuri loomiseks - CREATE, ALTER
- DML - Data Manipulation Language - Andmete lisamine ja uuendamine tabelisse - INSERT, UPDATE, DELETE
---
## Sisukord
1. [Andmebaasihaldussüsteemid](#andmebaasihaldussüsteemid)
2. [Põhimõisted](#põhimõisted)
3. [Andmetüübid](#andmetüübid)
4. [Piirangud](#piirangud)
5. [Seosed](#tabelivahelised-seosed)
6. [Stored Procedure](#stored-procedure)
7. [Navigeerimismenüü (Minu IT-Portfoolio)](#navigeerimismenüü)
8. [Andmebaasi SQL Skriptid](#-andmebaasi-sql-skriptid-koodifailid)
9. [Kodutöö keys.md](keys.md)

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
## Põhimõisted

* **Andmebaas** - Infokogum mis sisaldab infot nt telefoniraamat (struktureeritud andmete kogum).
* **Andmebaasihaldussüsteem (DBMS)** - Tarkvara, mida kasutatakse andmebaaside loomiseks, haldamiseks ja andmete töötlemiseks (nt MySQL, MS SQL Server).
* **Tabel** - olem (entity), mis koosneb ridadest ja veergudest.
* **Veerg (atribuut)** - väli (field), mis määratleb ära tabelisse sisestatava andmevälja omaduse ja tüübi.
* **Rida (kirje)** - kirje (record), mis kujutab endast ühte terviklikku andmeobjekti tabelis.
* **Primaarne võti (Primary Key)** - PK - veerg (tavaliselt nimega id) unikaalse identifikaatoriga mis eristab iga kirjet.
* **Välisvõti (võõrvõti) (Foreign Key)** - FK - veerg, mis loob seose teise tabeli primaarvõtmega.
* **Indeks** - Andmebaasi struktuur, mis kiirendab andmete otsimist tabelist (nagu raamatu sisukord).
* **Vaade (VIEW)** - Virtuaalne tabel, mille sisu on määratud SQL-päringu tulemusega (salvestatud päring).
* **Päring (SELECT)** - SQL lause, mida kasutatakse andmete küsimiseks ja kuvamiseks andmebaasist.
* **Tingimus (WHERE)** - Päringu osa, mida kasutatakse andmete filtreerimiseks vastavalt määratud kriteeriumile.
* **Sorteerimine (ORDER BY)** - Päringu osa, mis seab tulemused soovitud järjekorda (kas kasvavalt või kahanevalt).
* **Grupeerimine (GROUP BY)** - Kasutatakse ridade koondamiseks kokkuvõtvate funktsioonide (nt SUM, COUNT) abil.
* **Liitmine (JOIN)** - Operatsioon kahe või enama tabeli ridade ühendamiseks nendevaheliste seotud veergude põhjal.
* **Relatsioon** - Tabelitevaheline loogiline suhe või seos relatsioonilises andmebaasis.
* **Skeem** - Andmebaasi loogiline struktuur, mis kirjeldab tabeleid, välju, seoseid ja piiranguid.
* **Trigger** - Spetsiaalne salvestatud protseduur, mis käivitub andmebaasis automaatselt mingi sündmuse (nt INSERT, UPDATE, DELETE) peale.
* **Kasutaja ja õigused (GRANT, REVOKE)** - SQL käsud andmebaasi kasutajate õiguste haldamiseks (`GRANT` annab õigusi, `REVOKE` võtab õigusi ära).
---
## Andmetüübid
---
* **Numbrilised tüübid:**
  * **INT** - Täisarv (tavaline suurus).
  * **SMALLINT** - Väike täisarv (kasutatakse mälu säästmiseks).
  * **DECIMAL** - Täpne komakohaga arv, kus saab määrata pikkuse ja komakohad (nt `DECIMAL(6,2)`).
  * **FLOAT** - Ligikaudne ujuvkomaarv suurte matemaatiliste arvutuste jaoks.
* **Tekst / Sümbolid:**
  * **CHAR** - Fikseeritud pikkusega tekst (nt `CHAR(6)` - täidab tühikutega, kui tekst on lühem).
  * **VARCHAR** - Muutuva pikkusega tekst (nt `VARCHAR(50)` - võtab täpselt nii palju ruumi kui sisestatud tekst).
  * **TEXT** - Suuremahuline tekst (pikemad kirjeldused ja artiklid).
* **Loogiline tüüp:**
  * **BOOLEAN** - Loogiline väärtus, mis saab olla kas TÕENE või VÄÄR (`TRUE` / `FALSE`, mõnes süsteemis `bool` või `bit`).
* **Kuupäevad ja kellaajad:**
  * **DATE** - Ainult kuupäev (`YYYY-MM-DD`).
  * **TIME** - Ainult kellaaeg (`HH:MM:SS`).
  * **DATETIME** - Kombineeritud kuupäev ja kellaaeg ühes väljas.
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

--iseseisvalt: vali tabel ja kirjuta 3 protseduuri

--kliendi lisamine

CREATE PROCEDURE lisaKlient
@eesnimi varchar(25),
@perenimi varchar(30),
@telefon char(13),
@email varchar(25),
@tanav varchar(25),
@linn varchar(25),
@maakond varchar(25),
@zip char(5)
AS
BEGIN
    INSERT INTO customers
    VALUES (@eesnimi, @perenimi, @telefon, @email, @tanav, @linn, @maakond, @zip);

    SELECT * FROM customers;
END

--kutse
EXEC lisaKlient 'Toom', 'Kasek', '5551234', 'mari.kask@gmail.com', 'Pargi 5', 'Tallinn', 'Harjumaa', '10115';

--kliendi kustutamine id jargi
CREATE PROCEDURE kustutaKlient
@id int
AS
BEGIN
    SELECT * FROM customers;

    DELETE FROM customers
    WHERE customer_id = @id;

    SELECT * FROM customers;
END
--kutse
EXEC kustutaKlient 3;

--kliendi otsimine nime järgi
CREATE PROCEDURE otsiKlientNimeJargi
@taht char(1)
AS
BEGIN
    SELECT first_name, last_name
    FROM customers
    WHERE first_name LIKE @taht + '%';
END
--kutse
EXEC otsiKlientNimeJargi 'M';
```
# Minu IT-Portfoolio

Tere tulemast minu iseseisvate tööde ja andmebaaside portfooliolehele! 

---

## Navigeerimismenüü

Vali siit huvipakkuv teema, et näha põhjalikumaid selgitusi ja näiteid:

* [Andmebaasi võtmed (Keys)](keys.md) — *Põhjalik ülevaade andmebaasi võtmete tüüpidest (Primary, Foreign jne).*
* [Küsimused ja vastused](kysimused.md) — *20 küsimust DDLi ja DMLi kohta*
* [SQL Select päringud](select.md) — *Andmete valimise ja filtreerimise ülesanded.*

---

## Andmebaasi SQL Skriptid (Koodifailid)

Siit leiad kõik kursuse jooksul kirjutatud SQL laused ja tabelite loomise skriptid mida olen salvestanud:

### Tabelite loomine ja struktuur
* [CreateTablelaused.sql](CreateTablelaused.sql) — *Tabelite loomise algsed skriptid.*
* [ForeignKey.sql](ForeignKey.sql) — *Esimesed katsetused võõrvõtmetega.*
* [uusForeignKey.sql](uusForeignKey.sql) (ja [fail ilma laiendita](uusForeignKey)) — *Täiendatud võõrvõtmete seosed.*

### Hindelised ja iseseisvad tööd
* [hindelineylesanne.sql](hindelineylesanne.sql) — *Esimene suurem hindeline töö.*
* [hindelineylautod.sql](hindelineylautod.sql) — *Autode andmebaasi hindeline ülesanne.*
* [ylesanneteinetoo.sql](ylesanneteinetoo.sql) — *Teine iseseisev praktiline töö.*

### Harjutused ja näidised
* [salesproduction.sql](salesproduction.sql)
* [a.sql](a.sql)

---
