# Andmebaasi võtmed (Keys)

## 1. Primary Key (Primaarvõti)

**Definitsioon:**
Primary Key on veeru (või veergude kombinatsiooni) väärtus, mis identifitseerib iga tabeli rea unikaalselt.

**Kasutus:**
Tagab, et tabelis ei ole duplikaate ja iga kirje on unikaalne.

**Erinevus:**
Primary Key ei luba NULL väärtusi ja igas tabelis saab olla ainult üks Primary Key erinevalt Unique keyst.”

**Näide:**

```sql
CREATE TABLE Opilased (
    opilane_id INT PRIMARY KEY,
    nimi VARCHAR(50)
);
```

---

## 2. Foreign Key (Võõrvõti)

**Definitsioon:**
Foreign Key on veerg, mis viitab teise tabeli Primary Key-le.

**Kasutus:**
Loob seose tabelite vahel.

**Erinevus:**
Ei pea olema unikaalne ja võib sisaldada korduvaid väärtusi.

**Näide:**

```sql
CREATE TABLE Kursused (
    kursus_id INT PRIMARY KEY,
    nimetus VARCHAR(50)
);

CREATE TABLE Registreerimine (
    reg_id INT PRIMARY KEY,
    kursus_id INT,
    FOREIGN KEY (kursus_id) REFERENCES Kursused(kursus_id)
);
```

---

## 3. Unique Key

**Definitsioon:**
Unique Key tagab, et kõik väärtused veerus on unikaalsed.

**Kasutus:**
Kasutatakse siis, kui väärtused peavad olema kordumatud, kuid ei ole Primary Key.

**Erinevus:**
Compound Key erineb Composite Key-st selle poolest, et kõik väljad on ka Foreign Key-d.

**Näide:**

```sql
CREATE TABLE Opetajad (
    email VARCHAR(100) UNIQUE
);
```

---

## 4. Simple Key

**Definitsioon:**
Simple Key koosneb ühest atribuudist (veerust).

**Kasutus:**
Kui üks veerg piisab kirje unikaalseks tuvastamiseks.

**Erinevus:**
Erinevalt composite key-st koosneb ainult ühest väljast.

**Näide:**

```sql
CREATE TABLE Raamatud (
    ISBN VARCHAR(20) PRIMARY KEY
);
```

---

## 5. Composite Key

**Definitsioon:**
Composite Key koosneb mitmest veerust, mis koos tagavad unikaalsuse.

**Kasutus:**
Kui üks veerg ei ole piisav unikaalsuse tagamiseks.

**Erinevus:**
Koosneb mitmest atribuudist.

**Näide:**

```sql
CREATE TABLE Tellimused (
    klient_id INT,
    toode_id INT,
    PRIMARY KEY (klient_id, toode_id)
);
```

---

## 6. Compound Key

**Definitsioon:**
Compound Key on Composite Key tüüp, kus kõik osad on ka Foreign Key-d.

**Kasutus:**
Kasutatakse sageli seostabelites (many-to-many).

**Erinevus:**
Kõik veerud viitavad teiste tabelite võtmetele.

**Näide:**

```sql
CREATE TABLE OpilaneKursus (
    opilane_id INT,
    kursus_id INT,
    PRIMARY KEY (opilane_id, kursus_id),
    FOREIGN KEY (opilane_id) REFERENCES Opilased(opilane_id),
    FOREIGN KEY (kursus_id) REFERENCES Kursused(kursus_id)
);
```

---

## 7. Superkey

**Definitsioon:**
Superkey on ükskõik milline atribuutide kombinatsioon, mis identifitseerib rea unikaalselt.

**Kasutus:**
Teoreetiline mõiste, millest tuletatakse candidate key-d.

**Erinevus:**
Võib sisaldada üleliigseid atribuute.

**Näide:**

```text
(liige_id, nimi) – on superkey, sest liige_id üksi juba määrab kirje
```

---

## 8. Candidate Key

**Definitsioon:**
Candidate Key on minimaalne superkey.

**Kasutus:**
Valitakse üks Primary Key-ks.

**Erinevus:**
Ei sisalda üleliigseid atribuute.

**Näide:**

```text
liige_id ja email võivad mõlemad olla candidate key-d, sest mõlemad on unikaalsed
```

---

## 9. Alternate Key

**Definitsioon:**
Alternate Key on candidate key, mida ei valitud Primary Key-ks.

**Kasutus:**
Pakub alternatiivset unikaalset identifikaatorit.

**Erinevus:**
Ei ole Primary Key, kuid on siiski unikaalne.

**Näide:**

```sql
CREATE TABLE Kasutajad (
    kasutaja_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

---

## Kasutatud allikad

* https://www.w3schools.com/sql/
* https://www.geeksforgeeks.org/dbms-keys-in-relational-database/
* Õppematerjalid (tunnimaterjalid)

 <img width="1751" height="773" alt="image" src="https://github.com/user-attachments/assets/498c889e-a065-4687-8cf7-cecafe66ef07" />
<img width="1625" height="714" alt="image" src="https://github.com/user-attachments/assets/876d4869-fed1-4f01-b383-6acba84e969f" />
<img width="1671" height="680" alt="image" src="https://github.com/user-attachments/assets/ee312ed6-7d78-43b9-985c-925c6fb16269" />
<img width="1663" height="720" alt="image" src="https://github.com/user-attachments/assets/52e575c9-65a3-4509-8acf-ce9864d1868e" /><img width="1583" height="693" alt="image" src="https://github.com/user-attachments/assets/36553f57-4a82-4f34-b260-8fc7403d1aa5" />
<img width="1735" height="740" alt="image" src="https://github.com/user-attachments/assets/daeff742-d5d4-4384-a629-df7a4451270d" />
<img width="1470" height="825" alt="image" src="https://github.com/user-attachments/assets/6bdb46d9-7e43-46e3-bb85-94af2e14ce46" />
<img width="1408" height="611" alt="image" src="https://github.com/user-attachments/assets/1e69ed7d-2aa1-438c-9aef-35d5b51c697f" />




