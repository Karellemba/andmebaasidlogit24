
 | [küsimused](küsimused.md) | [KasutajaloomineXamppis](kasutajaloomineXamppis.md) | [trigger](trigger.md) | [keys](keys.md) | [kasutajaloomineSQL](kasutajaloomineSQL.md) | [vaade](vaade.md)



Triger - andmebaasi objekt, mis käivitub automaatselt, kui toimub teatud sündmus (nt INSERT, UPDATE, DELETE).
Trigerite loomine - automatseerub protsessid SQL Serveris.

Tabelid mis tuleb luua enna trigerit!

Create database trigerLogitpe24;

use trigerLogitpe24;
CREATE TABLE linnad(
linnId int primary key identity(1,1),
linnanimi varchar(30) unique,
maakond varchar(50),
rahvaarv int);
select * from linnad;
INSERT INTO linnad(linnanimi, maakond, rahvaarv)
VALUES ('Tallinn', 'Harjumaa', 600000);

--tabel logi - tabel, mis täidab triger, kui kasutaja täidab tabeli linnad!
CREATE TABLE logi(
id int primary key identity(1,1),
kasutaja varchar(50),
aeg DATETIME,
andmed TEXT);
--1. Triger lisatud andmete jälgimeseks tabelis linnad.
--jälgib linna sisestamine tabelisse ja teeb vastava kirje logi-tabelis
CREATE TRIGGER linnaLisamine
ON linnad -- tabel, mida triger jälgib
FOR INSERT
AS
INSERT INTO logi(kasutaja, aeg, andmed)
SELECT 
SYSTEM_USER, --siselogitud user
GETDATE(), 
CONCAT('lisatud: ',inserted.linnanimi,', ',
inserted.maakond,', ',inserted.rahvaarv)
FROM inserted;

--kontrollimiseks tuleb lisada linna tabelisse linnad
INSERT INTO linnad(linnanimi, maakond, rahvaarv)
VALUES ('Viljandi', 'Viljandimaa', 50000);

SELECT * FROM linnad;
SELECT * FROM logi;
<img width="481" height="624" alt="{8D089BDB-70B8-47EA-B727-B459B497D35B}" src="https://github.com/user-attachments/assets/0b2edad5-b659-4ce5-a90b-08ef08a8c182" />


--2. DELETE triger - jälgib kustutamine tabelis linnad 
--ja teeb vastava kirje logi tabelisse
CREATE TRIGGER linnaKustutamine
ON linnad -- tabel, mida triger jälgib
FOR DELETE
AS
INSERT INTO logi(kasutaja, aeg, andmed)
SELECT 
SYSTEM_USER, --siselogitud user
GETDATE(), 
CONCAT('kustutatud: ',deleted.linnanimi,', ',
deleted.maakond,', ',deleted.rahvaarv)
FROM deleted;

XAMPP / mariaDB päästikud / trigerid
INSERT TRIGER
<img width="528" height="567" alt="{6A1BD5C0-B232-4F97-99DF-772AF8ABEBF9}" src="https://github.com/user-attachments/assets/0c982f54-4d96-4170-ab5a-933507a10b80" />

Tulemus logi tabelist - 
DELETE TRIGER
<img width="424" height="243" alt="{34F2C093-2456-43A5-A597-EA7FEE19CC97}" src="https://github.com/user-attachments/assets/45e0b641-ff62-42b1-beff-4f131cb6aaa2" />


UPDATE TRIGER
<img width="414" height="304" alt="{03565F5C-31D7-4068-8CFD-8499FF224DF7}" src="https://github.com/user-attachments/assets/d4c7b0f4-b4ef-46d4-a96d-972714ead8dd" />

<img width="347" height="178" alt="{BC37BCFE-36C2-41A8-B41E-44E7D44C8EE3}" src="https://github.com/user-attachments/assets/bae97165-604b-454a-8d2e-5e032752265c" />
