
 | [küsimused](küsimused.md) | [KasutajaloomineXamppis](kasutajaloomineXamppis.md) | [trigger](trigger.md) | [keys](keys.md) | [kasutajaloomineSQL](kasutajaloomineSQL.md)

SQL Server – Kasutajate autentimine ja õiguste haldamine
Mis on autentimine SQL Serveris?

Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.
SQL Serveris kasutatakse kahte peamist autentimise tüüpi:

Windows Authentication Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.
Kasutajanimi ja parool on seotud Windowsiga. Turvalisem lahendus. Paroole haldab Windows. Kasutaja ei pea eraldi SQL Serveri parooli teadma.

SQL Server Authentication
Selle puhul luuakse kasutaja otse SQL Serverisse. Kasutaja ei ole seotud Windowsiga. Määratakse eraldi kasutajanimi ja parool. Sobib veebirakenduste jaoks.
SQL Server – Kasutajate autentimine ja õiguste haldamine
Mis on autentimine SQL Serveris?

Autentimine tähendab kasutaja tuvastamist ehk kontrollimist, kas kasutajal on õigus SQL Serverisse sisse logida.
SQL Serveris kasutatakse kahte peamist autentimise tüüpi:

Windows Authentication Selle puhul kasutatakse samu kasutajaandmeid, millega logitakse sisse Windows operatsioonisüsteemi.
Kasutajanimi ja parool on seotud Windowsiga. Turvalisem lahendus. Paroole haldab Windows. Kasutaja ei pea eraldi SQL Serveri parooli teadma.

SQL Server Authentication
Selle puhul luuakse kasutaja otse SQL Serverisse. Kasutaja ei ole seotud Windowsiga. Määratakse eraldi kasutajanimi ja parool. Sobib veebirakenduste jaoks.

Näide kasutajast: DirectorKarel. Parool: director

Kasutaja loomine SQL Serveris
Serveritaseme kasutaja loomine (Login) Sammud Ava:
Security → Logins Tee paremklikk ja vali:

New Login...
<img width="835" height="672" alt="{6A093429-03C1-47D8-B36F-B05869021CDE}" src="https://github.com/user-attachments/assets/004c3171-1b07-4fe2-b6f2-1522ee9a4623" />

Harjutamiseks võib eemaldada linnukese: User must change password at next login.

Server Roles Menüüst Server Roles saab määrata serveri üldised õigused.

Tavaliselt piisab rollist: public
<img width="749" height="675" alt="{2F3F85D9-EEE3-479E-8140-332054B32D80}" src="https://github.com/user-attachments/assets/520409c1-9865-495c-8ee7-612ed9583042" />

Andmebaasi kasutaja loomine (User) Ava:
Database → Security → Users Tee paremklikk: New User...
Membership ja õigused Menüüst Membership saab määrata kasutaja rollid.

db_datareader → võib lugeda SELECT

db_datawriter → võib kirjutada INSERT, UPDATE, DELETE
<img width="777" height="769" alt="{4AB0CB9D-8C36-4DC7-8387-3621F19EAA47}" src="https://github.com/user-attachments/assets/8d540138-d95c-443e-87f4-b41b9f69e9b2" />

Kasutaja õiguste kontroll
tuleb sisselogida kasutajana directorKarel. Connect--> Database Engine

saab tabeli sisu näha ja sisestada uus kiri.
<img width="727" height="661" alt="{2DF2924F-B267-49BF-911D-21BFF444672C}" src="https://github.com/user-attachments/assets/7e140af6-43cc-43e9-8cb3-840238774d91" />

kontrollime tegevus, mis ei ole lubatud kasutajale, näiteks tabeli loomine.
<img width="535" height="124" alt="{018F2C24-33F6-4CDF-8604-D1147AFCABE2}" src="https://github.com/user-attachments/assets/4ba6aa78-c210-45a3-912e-dd5b72288512" />

SQL Server Authentication Mode muutmine Kui ilmub viga: Error 18456, siis on tavaliselt lubatud ainult Windows Authentication. Lahendus Server → Properties Security Vali: SQL Server and Windows Authentication mode GRANT käsud õiguste jagamiseks GRANT käsuga antakse kasutajale õigused.
--GRANT - õiguste määramine
--DENY - õiguste keelamine

--db_datareader -SELECT 
--db_datawriter - INSERT, DELETE, UPDATE

--anname kasutajale directorKarel õigus 
--ainult kustutada ja uuendada tabelit 
--(DELETE, UPDATE, SELECT)

GRANT DELETE ON puhkus TO directorKarel;
GRANT UPDATE ON puhkus TO directorKarel;
GRANT SELECT ON puhkus TO directorKarel;
<img width="1030" height="508" alt="{CB05DA7F-E2C1-404C-A93A-61CD18DA01C2}" src="https://github.com/user-attachments/assets/1e7713d3-8b60-4a52-8bf7-19f626782f47" />

--keelame INSERT
DENY INSERT ON puhkus TO directorKarel;
<img width="764" height="677" alt="{947E6E2E-89F2-4A9C-A59A-7DB4ABF2485F}" src="https://github.com/user-attachments/assets/8c663a58-ec00-406a-aea2-ea2f170e71b3" />


Käsk Tähendus SELECT Lugemine INSERT Lisamine UPDATE Muutmine DELETE Kustutamine
<img width="598" height="359" alt="{D02D71F4-29D1-481D-84B3-033920C8BBD6}" src="https://github.com/user-attachments/assets/704a9a49-8820-4e3c-9578-136592d9cf06" />


