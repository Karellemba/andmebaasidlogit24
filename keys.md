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
<img width="696" height="493" alt="{59F9EC9D-3319-4643-958C-4DBC368E8D59}" src="https://github.com/user-attachments/assets/f8a0788d-7d4c-49a2-b575-4553f1f6e864" />

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
<img width="583" height="468" alt="{9B92FA5F-6DC3-4DD1-BE52-3491FA02782D}" src="https://github.com/user-attachments/assets/5041254f-9d2e-4c9c-8c59-1cf3294c44af" />
<img width="423" height="471" alt="{302C7E72-012C-4C52-98D0-86F0EBEAE3B9}" src="https://github.com/user-attachments/assets/2a69e3dc-96ae-48c6-9a59-8a6570c72436" />

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
<img width="510" height="428" alt="{5D8B7BF2-0EDB-427E-BD26-C083E8955554}" src="https://github.com/user-attachments/assets/914a9e9f-16ba-4010-9d08-255dbef3c6c1" />

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
<img width="353" height="572" alt="{4918A59E-136E-40B9-9683-8AFBE3A1050A}" src="https://github.com/user-attachments/assets/38957ed2-6886-47f0-85d6-896c8165ea7d" />

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
<img width="408" height="359" alt="{F31105FF-73E5-4A04-9EEA-A52C64AB477C}" src="https://github.com/user-attachments/assets/7845b770-9633-441b-8fd8-44bdb109742c" />

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
<img width="572" height="483" alt="{5A526B39-7A73-4337-9C1E-455F5B80D1D1}" src="https://github.com/user-attachments/assets/78bcdc78-6129-4fc6-885a-561e00315e07" />

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
CREATE TABLE customers (
    customer_number VARCHAR(20),
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),

    -- Alternate keys
    CONSTRAINT uq_customer_number UNIQUE (customer_number),
    CONSTRAINT uq_email UNIQUE (email)
);
```
<img width="422" height="291" alt="{4F261398-2B25-4E01-937B-360FB2776336}" src="https://github.com/user-attachments/assets/76c711f2-d0ea-48bb-b77b-8f938db6b90c"/>

---

## Kasutatud allikad
https://www.w3schools.com/sql/
[https://www.postgresql.org/docs/current/ddl-constraints.html?






