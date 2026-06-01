# Andmebaaside Õpetaja portfoolio || LOGITpe24

Andmebaasidega seotud SQL kood ja konspektid.

## Sisukord

- [Andmebaasihaldussüsteemid](#andmebaasihaldussüsteemid)
- [Põhimõisted](#põhimõisted)
- [Andmetüübid](#andmetüübid)
- [Piirangud](#piirangud)
- [Tabelivahelised Seosed](#tabelivahelised-seosed)

---

## Andmebaasihaldussüsteemid

1. SQL Server Management Studio (SSMS)
2. XAMPP + phpMyAdmin

![SQL Server](images/sqlserver.png)

---

## Põhimõisted

- Andmebaas – struktureeritud andmete kogum
- Tabel – objekt andmete hoidmiseks
- Veerg – väli (field)
- Rida – kirje (record)

### Primaarvõti

- PK (Primary Key)
- Unikaalne identifikaator

### Välisvõti

- FK (Foreign Key)
- Seob tabelid omavahel

---

## Andmetüübid

- INT
- FLOAT
- DECIMAL(6,2)
- VARCHAR(50)
- CHAR(6)
- DATE
- DATETIME
- BOOLEAN

---

## Piirangud

1. PRIMARY KEY
2. FOREIGN KEY
3. UNIQUE
4. NOT NULL
5. CHECK

---

## Tabelivahelised Seosed

### One-to-Many

```sql
CREATE TABLE Klass (
    KlassID INT PRIMARY KEY,
    Nimi VARCHAR(50)
);

CREATE TABLE Opilane (
    OpilaneID INT PRIMARY KEY,
    Nimi VARCHAR(50),
    KlassID INT,
    FOREIGN KEY (KlassID)
    REFERENCES Klass(KlassID)
);
```

### Many-to-Many

```sql
CREATE TABLE OpilaneKursus (
    OpilaneID INT,
    KursusID INT,
    PRIMARY KEY (OpilaneID, KursusID)
);
```
