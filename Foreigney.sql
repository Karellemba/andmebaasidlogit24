CREATE TABLE opilaneTunnis(
opilaneTunnisId int Primary Key identity (1, 1),
kuupaev date not Null,
opilaneId int,
Foreign Key (opilaneId) References opilane(opilaneId), --tabel(PK veerg)
oppeaine varchar(25),
hinne int);
select * from opilane;
select * from opilaneTunnis;

--lisame andmeid opilaneTunnis tabelisse
INSERT INTO opilaneTunnis
VALUES ('2025-04-14', 2, 'keemia', 4);
--testtabel
Create table testTabel(
id int primary key);
--tabeli kustutamine
DROP TABLE testTabel;
Drop Database Tarpv23;

--tabelirida kustutamine
select * from opilane;
DELETE FROM opilane WHERE opilaneId=4;
