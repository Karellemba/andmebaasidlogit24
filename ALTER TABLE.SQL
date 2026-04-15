--uue veeru lisamine
ALTER TABLE opilane ADD telefon varchar(1);

--tabeli struktuuri muutmine -veeru kustutamine
ALTER TABLE opilane DROP COLUMN telefon;

--tabeli muutmine - veeru andmetüübi vahetamineALTER TABLE opilane ALTER COLUMN telefon varchar(13);

--store procedure help, mis näitab tabeli struktuuri ja veerude andmetüübid.
sp_help opilane;
drop table ryhm;

CREATE TABLE ryhm(
ryhmID int NOT NULL,
ryhmNimi varchar(10));

select * from ryhm
--muutame tabeli ryhm ja lisame primary key
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm Primary Key (ryhmID);

--muudame tabeli ryhm ja teeme ryhmNimi unikaalseks UNIQUE
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi);

sp_help ryhm;


--täidame tabeli ryhm
INSERT INTO ryhm(ryhmID, ryhmNimi)
values (3, 'LOGITpe24'),(4, 'TITpe24');
select * from ryhm;

--FOREIGN KEY --opilane tabelis
--lisame opilane tabelisse uus veerg
ALTER TABLE opilane ADD ryhmID int;
Select * from opilane
--lisame ryhmID foreign Key
ALTER TABLE opilane ADD constraint fk_ryhm
FOREIGN KEY (ryhmID) REFERENCES ryhm(ryhmID) --link tabel (PK veerg)

--kontrollimiseks täidame tabeli opilane
INSERT into opilane
VALUES ('Kevin', 'Allik', '2003-10-23' , 0, 'Tartu, Eesti', 4.5, '+3555', 1)
Select * FROM opilane
Select * from ryhm
