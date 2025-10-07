# Data Storage and Management Assignment 1  
**Author:** Patrick Zhu  
**Course:** Data Storage and Management  
**Database:** SQLite  
**Dataset:** University Rankings (2012–2015)

---

## Database Connection

Successfully connected to the SQLite database using the VS Code SQLite Plugin.

**Verification Command:**
```sql
SELECT name FROM sqlite_master WHERE type='table';
```

**Output:**
```
university_rankings
```

The database connection was established successfully, and the main table `university_rankings` was recognized.

---

## Table Structure

The structure of the table was examined using:
```sql
PRAGMA table_info(university_rankings);
```

**Output:**

| Column Name | Type | Description |
|--------------|------|-------------|
| world_rank | INTEGER | Global university ranking |
| institution | TEXT | University name |
| country | TEXT | Country |
| national_rank | INTEGER | National ranking |
| quality_of_education | INTEGER | Education quality metric |
| alumni_employment | INTEGER | Alumni employment metric |
| quality_of_faculty | INTEGER | Faculty quality metric |
| publications | INTEGER | Research publications |
| influence | INTEGER | Academic influence |
| citations | INTEGER | Citation count |
| broad_impact | INTEGER | Broad impact index |
| patents | INTEGER | Patent output |
| score | REAL | Total score |
| year | INTEGER | Year of ranking |

---

## Basic Analysis

### 1. Total Rows in the Dataset
```sql
SELECT COUNT(*) AS total_rows FROM university_rankings;
```

**Result:**
```
total_rows
-----------
2200
```

There are 2200 total entries in the dataset, representing global university rankings from 2012 to 2015.

---

### 2. Universities per Year
```sql
SELECT year, COUNT(*) AS num_universities
FROM university_rankings
GROUP BY year
ORDER BY year;
```

**Result:**

| Year | Number of Universities |
|------|------------------------|
| 2012 | 100 |
| 2013 | 100 |
| 2014 | 1000 |
| 2015 | 1000 |

The dataset shows a significant increase in entries starting in 2014, expanding from 100 universities per year to 1000 universities per year for 2014 and 2015.

---

### 3. Top 5 Countries by Number of Universities
```sql
SELECT country, COUNT(*) AS num_universities
FROM university_rankings
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 5;
```

**Result:**

| Country | Number of Universities |
|----------|------------------------|
| USA | 573 |
| China | 167 |
| Japan | 159 |
| United Kingdom | 144 |
| Germany | 115 |

The United States has the most universities in the dataset (573), followed by China, Japan, the United Kingdom, and Germany.

---

### 4. Average Score Across All Universities
```sql
SELECT AVG(score) AS avg_score FROM university_rankings;
```

**Result:**
```
avg_score
----------
47.7983954545455
```

The average score across all universities in the dataset is approximately **47.8**.

---

### 5. Top 10 Universities in 2014
```sql
SELECT world_rank, institution, country, score
FROM university_rankings
WHERE year = 2014
ORDER BY world_rank ASC
LIMIT 10;
```

**Result:**

| World Rank | Institution | Country | Score |
|-------------|-------------|----------|--------|
| 1 | Harvard University | USA | 100.00 |
| 2 | Stanford University | USA | 99.09 |
| 3 | Massachusetts Institute of Technology | USA | 98.69 |
| 4 | University of Cambridge | United Kingdom | 97.64 |
| 5 | University of Oxford | United Kingdom | 97.51 |
| 6 | Columbia University | USA | 97.41 |
| 7 | University of California, Berkeley | USA | 92.84 |
| 8 | University of Chicago | USA | 92.03 |
| 9 | Princeton University | USA | 88.56 |
| 10 | Yale University | USA | 88.11 |

The top universities in 2014 are dominated by institutions from the United States and the United Kingdom, with Harvard University ranked first overall.

---

### Summary of Findings
- The dataset contains **2200 total records** from 2012–2015.  
- Data coverage expands significantly in 2014 and 2015.  
- **USA** is the most represented country with **573 universities**.  
- The **average global score** is approximately **47.8**.  
- The **top universities** in 2014 include Harvard, Stanford, MIT, Cambridge, and Oxford.

---

## CRUD Operations

### Create (Insert)
```sql
INSERT INTO university_rankings (
    world_rank, institution, country, national_rank,
    quality_of_education, alumni_employment, quality_of_faculty,
    publications, influence, citations, broad_impact,
    patents, score, year
)
VALUES (
    350, 'Duke Tech', 'USA', NULL,
    NULL, NULL, NULL,
    NULL, NULL, NULL, NULL,
    NULL, 60.5, 2014
);
```
This SQL statement inserts a new record for **Duke Tech**, a university located in the United States.  
It assigns a world rank of 350, a score of 60.5, and specifies the year as 2014.  
All other columns are left as NULL because no detailed metric data is available for this new entry.

---

### Read (Query)
```sql
SELECT COUNT(*) AS japan_top200_2013
FROM university_rankings
WHERE country = 'Japan'
  AND year = 2013
  AND world_rank <= 200;
```
This query retrieves the number of Japanese universities ranked within the global top 200 for the year 2013.

---

### Update (Modify)
```sql
UPDATE university_rankings
SET score = score + 1.2
WHERE institution = 'University of Oxford'
  AND year = 2014;
```
This SQL command adjusts the record for the University of Oxford in 2014 by increasing its score by 1.2 points to correct a previous miscalculation.

---

### Delete (Remove)
```sql
DELETE FROM university_rankings
WHERE year = 2015
  AND score < 45;
```
This SQL command removes all universities from the 2015 dataset that have a score below 45, in accordance with updated ranking criteria.

---

## Summary of CRUD Operations

| Operation | Purpose | Description |
|------------|----------|-------------|
| Create | Add new data | Inserts a new record for Duke Tech (USA, 2014). |
| Read | Retrieve data | Counts how many Japanese universities were ranked in the top 200 in 2013. |
| Update | Modify existing data | Increases the 2014 University of Oxford score by 1.2 points. |
| Delete | Clean data | Removes 2015 entries with scores below 45. |

---
