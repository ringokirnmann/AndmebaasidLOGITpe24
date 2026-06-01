# Andmebaasi võtmed (Keys)

## 1. Primary Key

### Definitsioon

Primary Key (primaarvõti) on väli või väljade kombinatsioon, mis identifitseerib iga tabeli rea üheselt.

### Milleks kasutatakse?

* Andmete üheseks tuvastamiseks.
* Duplikaatide vältimiseks.
* Tabelite vaheliste seoste loomiseks.

### Erinevus teistest võtmetest

Tabelis saab olla ainult üks Primary Key.

### Näide

```sql
CREATE TABLE Opilased (
    opilane_id INT PRIMARY KEY,
    nimi VARCHAR(50)
);
```

Tabeli näidisandmed:

```sql
INSERT INTO Opilased VALUES (1, 'Mari');
INSERT INTO Opilased VALUES (2, 'Jaan');
```

<img width="979" height="556" alt="image" src="https://github.com/user-attachments/assets/8f894d56-e344-4c91-b303-111583be4874" />

---

## 2. Foreign Key

### Definitsioon

Foreign Key (võõrvõti) on väli, mis viitab teise tabeli Primary Key väärtusele.

### Milleks kasutatakse?

* Tabelite ühendamiseks.
* Andmete tervikluse tagamiseks.

### Erinevus teistest võtmetest

Foreign Key ei pea olema unikaalne.

### Näide

```sql
CREATE TABLE Kursused (
    kursus_id INT PRIMARY KEY,
    nimetus VARCHAR(50)
);

CREATE TABLE Registreerimised (
    reg_id INT PRIMARY KEY,
    opilane_id INT,
    kursus_id INT,
    FOREIGN KEY (kursus_id)
        REFERENCES Kursused(kursus_id)
);
```

<img width="1055" height="467" alt="image" src="https://github.com/user-attachments/assets/99997291-4767-414d-8229-ae4c144b747b" />


---

## 3. Unique Key

### Definitsioon

Unique Key tagab, et veerus olevad väärtused on unikaalsed.

### Milleks kasutatakse?

* Duplikaatide vältimiseks.
* Alternatiivse identifikaatori loomiseks.

### Erinevus teistest võtmetest

Tabelis võib olla mitu Unique Key'd.

### Näide

```sql
CREATE TABLE Kasutajad (
    kasutaja_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

<img width="851" height="403" alt="image" src="https://github.com/user-attachments/assets/d96cddb7-5c9f-42ec-9896-f843dcacceb5" />


---

## 4. Simple Key

### Definitsioon

Simple Key koosneb ainult ühest atribuudist.

### Milleks kasutatakse?

* Rea üheseks identifitseerimiseks ühe veeru abil.

### Erinevus teistest võtmetest

Koosneb ainult ühest väljast.

### Näide

```sql
CREATE TABLE Tooted (
    toode_id INT PRIMARY KEY,
    nimetus VARCHAR(100)
);
```

<img width="855" height="400" alt="image" src="https://github.com/user-attachments/assets/8c8f1744-865f-405c-a7f2-3524c4a9499b" />


---

## 5. Composite Key

### Definitsioon

Composite Key koosneb kahest või enamast väljast.

### Milleks kasutatakse?

* Kui üks veerg ei suuda ridu üheselt identifitseerida.

### Erinevus teistest võtmetest

Koosneb mitmest väljast.

### Näide

```sql
CREATE TABLE Hinded (
    opilane_id INT,
    aine_id INT,
    hinne INT,
    PRIMARY KEY (opilane_id, aine_id)
);
```

<img width="863" height="415" alt="image" src="https://github.com/user-attachments/assets/77ff27c1-defd-4402-b50d-7a22de25678f" />


---

## 6. Compound Key

### Definitsioon

Compound Key on Composite Key erivorm, kus kõik võtme osad on tähenduslikud ja sageli viitavad teiste tabelite võtmetele.

### Milleks kasutatakse?

* Mitme tabeli seoste kirjeldamisel.

### Erinevus teistest võtmetest

Koosneb mitmest väljast ning sageli sisaldab Foreign Key välju.

### Näide

```sql
CREATE TABLE Tellimused (
    klient_id INT,
    toode_id INT,
    kogus INT,
    PRIMARY KEY (klient_id, toode_id)
);
```

<img width="874" height="409" alt="image" src="https://github.com/user-attachments/assets/0103f4bc-3eb6-4ed5-a13a-7d9bd7eb6d34" />


---

## 7. Superkey

### Definitsioon

Superkey on üks või mitu atribuuti, mis identifitseerivad rea üheselt.

### Milleks kasutatakse?

* Kandidaatvõtmete leidmiseks.

### Erinevus teistest võtmetest

Võib sisaldada üleliigseid atribuute.

### Näide

Tabel:

```sql
CREATE TABLE TooTajad (
    tootaja_id INT PRIMARY KEY,
    isikukood VARCHAR(11) UNIQUE,
    nimi VARCHAR(50)
);
```

<img width="856" height="434" alt="image" src="https://github.com/user-attachments/assets/f96575d8-facb-4abe-89cc-5151985c0154" />



Superkey näited:

* tootaja_id
* isikukood
* (tootaja_id, nimi)
---

## 8. Candidate Key

### Definitsioon

Candidate Key on minimaalne Superkey.

### Milleks kasutatakse?

* Primary Key valimiseks.

### Erinevus teistest võtmetest

Ei sisalda üleliigseid atribuute.

### Näide

Tabelis TooTajad:

```text
tootaja_id
isikukood
```

Mõlemad võivad olla Candidate Key'd.


<img width="856" height="434" alt="image" src="https://github.com/user-attachments/assets/e0de44bf-089f-4b1c-a998-72c53798eea7" />


---

## 9. Alternate Key

### Definitsioon

Alternate Key on Candidate Key, mida ei valitud Primary Keyks.

### Milleks kasutatakse?

* Alternatiivse unikaalse identifikaatorina.

### Erinevus teistest võtmetest

On Candidate Key, kuid mitte Primary Key.

### Näide

```sql
CREATE TABLE Opetajad (
    opetaja_id INT PRIMARY KEY,
    isikukood VARCHAR(11) UNIQUE,
    nimi VARCHAR(50)
);
```

<img width="851" height="436" alt="image" src="https://github.com/user-attachments/assets/62b26cd4-addf-4778-84af-659ec7bb9a0f" />


Siin:

* Primary Key = opetaja_id
* Alternate Key = isikukood

---

# Kokkuvõte

Võti          | Unikaalne | Võib olla mitu |
------------- | --------- | -------------- |
Primary Key   | Jah       | Ei             |
Foreign Key   | Ei        | Jah            |
Unique Key    | Jah       | Jah            |
Simple Key    | Jah       | Jah            |
Composite Key | Jah       | Jah            |
Compound Key  | Jah       | Jah            |
Superkey      | Jah       | Jah            |
Candidate Key | Jah       | Jah            |
Alternate Key | Jah       | Jah            |

Kõik näited on tehtud veebilehel www.db-fiddle.com MySQL v8ga

# Kasutatud allikad

1. https://www.w3schools.com/sql/sql_primarykey.asp
2. https://www.w3schools.com/sql/sql_foreignkey.asp
3. https://en.wikipedia.org/wiki/Unique_key
4. https://www.geeksforgeeks.org/dbms/types-of-keys-in-relational-model-candidate-super-primary-alternate-and-foreign/
5. https://www.geeksforgeeks.org/sql/composite-key-in-sql/
6. https://dba.stackexchange.com/questions/3134/in-sql-is-it-composite-or-compound-keys
7. https://www.geeksforgeeks.org/dbms/super-key-in-dbms/
8. https://en.wikipedia.org/wiki/Candidate_key
9. https://www.geeksforgeeks.org/sql/sql-alternate-key/
    
