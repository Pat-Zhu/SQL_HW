# Data Storage and Management Assignment 1

## Overview
This project uses SQLite to explore and manage the **University Rankings (2012–2015)** dataset.
Tasks include connecting to the database, performing analysis, and executing CRUD operations.

---

## Database Overview
- Total Rows: **2200**
- Years Covered: **2012–2015**
- Average Score: **47.8**
- Top 5 Countries by Count: USA, China, Japan, UK, Germany

---

## Basic Analysis
| Query | Purpose | Summary |
|--------|----------|----------|
| `SELECT COUNT(*)` | Count rows | 2200 total rows |
| `GROUP BY year` | Count universities per year | 2014 & 2015 have 1000 each |
| `AVG(score)` | Compute average score | 47.8 |
| `ORDER BY world_rank LIMIT 10` | Top 10 universities in 2014 | Harvard, Stanford, MIT, etc. |

---

## CRUD Operations

### 🟩 Insert
```sql
INSERT INTO university_rankings (...) VALUES (...);

