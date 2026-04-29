create database logitpe24
use logitpe24


--1 tabel klient

CREATE TABLE klient (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nimi VARCHAR(100) NOT NULL,
    linn VARCHAR(100),
    vanus INT,
    saldo DECIMAL(10,2)
);

--2 andmete lisamine

INSERT INTO klient (nimi, linn, vanus, saldo)
VALUES 
('Mari Maasikas', 'Tallinn', 28, 150.50),
('Jaan Tamm', 'Tartu', 35, 80.00),
('Kati Kask', 'Pärnu', 22, 200.00);

--protseduurid

--1. kuva klient

CREATE PROCEDURE kuvaKliendid
AS
BEGIN
    SELECT id, nimi, linn FROM klient;
END;

--2. Lisa klient

CREATE PROCEDURE lisaKlient
    @nimi VARCHAR(100),
    @linn VARCHAR(100),
    @vanus INT,
    @saldo DECIMAL(10,2)
AS
BEGIN
    INSERT INTO klient (nimi, linn, vanus, saldo)
    VALUES (@nimi, @linn, @vanus, @saldo);
END;

--3. Muuda kliendi andmed
CREATE PROCEDURE muudaKlient
    @id INT,
    @linn VARCHAR(100),
    @saldo DECIMAL(10,2)
AS
BEGIN
    UPDATE klient
    SET linn = @linn,
        saldo = @saldo
    WHERE id = @id;
END;

--4. Kustuta klient
CREATE PROCEDURE kustutaKlient
    @id INT
AS
BEGIN
    DELETE FROM klient
    WHERE id = @id;
END;

--5. Otsi klient
CREATE PROCEDURE otsiKlient
    @nimi VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM klient
    WHERE nimi LIKE @nimi + '%';
END;

--6. Saldo min/max
CREATE PROCEDURE saldoMinMax
    @minSaldo DECIMAL(10,2) OUTPUT,
    @maxSaldo DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT 
        @minSaldo = MIN(saldo),
        @maxSaldo = MAX(saldo)
    FROM klient;
END;

--7. Tingimuslause
CREATE PROCEDURE kliendiStaatus
AS
BEGIN
    SELECT 
        nimi,
        saldo,
        CASE 
            WHEN saldo > 100 THEN 'Hea klient'
            ELSE 'Tavaklient'
        END AS staatus
    FROM klient;
END;

--8. Veeru haldus
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;

--näited
EXEC kuvaKliendid;

EXEC lisaKlient 'Raivo', 'Narva', 40, 140.00;

EXEC muudaKlient 4, 'Pärnu', 180.00;

EXEC kustutaKlient 4;

EXEC otsiKlient 'M';

DECLARE @min DECIMAL(10,2), @max DECIMAL(10,2);
EXEC saldoMinMax @min OUTPUT, @max OUTPUT;
SELECT @min AS MinSaldo, @max AS MaxSaldo;

EXEC kliendiStaatus;

EXEC muudatus 'lisa';
