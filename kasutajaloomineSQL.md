
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
<img width="580" height="287" alt="{A70AF0D4-93DE-4879-ABC6-95705B141DA5}" src="https://github.com/user-attachments/assets/4986bd6b-0389-4501-a90c-1b3a1875d9e4" />
kontrollime tegevus, mis ei ole lubatud kasutajale, näiteks tabeli loomine.
<img width="608" height="336" alt="{80476606-C4BF-45E6-9C4D-8EFAEB5965E6}" src="https://github.com/user-attachments/assets/a530668f-5909-4499-b815-c9600651f758" />
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

--keelame INSERT
DENY INSERT ON puhkus TO directorKarel;

<img width="556" height="418" alt="{77B17C36-21D0-4C5E-A2B6-A8CFB795DFDA}" src="https://github.com/user-attachments/assets/4ef52b1e-bc07-429d-95b0-26bc8991c33c" />

Käsk Tähendus SELECT Lugemine INSERT Lisamine UPDATE Muutmine DELETE Kustutamine
<img width="631" height="447" alt="{575E1BB4-58B1-4540-8980-175C26E31BE9}" src="https://github.com/user-attachments/assets/94b1c030-8c3c-4fdd-9bc8-20f10d3fe335" />

