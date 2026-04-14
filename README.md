# andmebaasidlogit24
admebaasidega seotud sql kood ja konspektid

- SQL - structured Query Language -struktureeritud päringukeel
- DDL- Darta Definition Language -andmebaasi struktuuri loomiseks - CREATE, ALTER
- DML- Data Manipulation Language -andmete lisamine ja uuendamine tabelis - INSERT, UPDATE, DELETE

## SISUKORD
- admebaasihaldussüsteemid
- Põhimõisted
- Piirangud
- Tabelivahelised seosed
  
###tunnis me kasutame admebaasihaldussüsteemid:
1. SQL server management Stuudio (Sql Serveri haldamiseks) <img width="610" height="582" alt="{2E0BA43E-227A-45E4-A25F-3A163C441FBF}" src="https://github.com/user-attachments/assets/494db810-698d-4b1d-8f8a-28ac8a2f563c" />

2. XAMPP -phpmyAdmin (MariaDB andmebaas) -vabavara

   ## Põhimõisted
   Andmebaas- struktueeritud andmete kogum
- Tabel- olem (entity)
- veerg- väli (field)
- rida- kirje (record)
- primaarne võti- PK-primary Key - veerg (tavaliselt nimega id) unikaalse indentifikaatoriga, mis eristab iga kirjet
- Välisvõti (võõrvõti) -FK Foreign key - veerg, mis loob seose teise tabeli primaarvõtmega.

  ## Andmetüübid
  -INT, float, decimal(6,2)
  - varchar(50), char(6)
  - boolean, bool, bit -Loogiline tüüp
  - date, time, datetime -kuupäeva
 

 ## Piirangud
 ...
1. Primary Key
2. Foreign Key
3. CHECK
4. NOT NULL
5. UNIQUE
...

## Tabelivahelised seosed
- üks - ühele (nt mees --naine)
- üks-mitmele (õpilane käib erinevates õppeainetes)
-  <img width="680" height="404" alt="{5E57B149-3B17-4EE6-9F5C-B5F7194493FD}" src="https://github.com/user-attachments/assets/2dce32a5-4f52-4d96-8a5f-a3bfc081ef33" />

- mitu . mitmele (nt õpilane - õpetaja)

