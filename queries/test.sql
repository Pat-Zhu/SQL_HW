SELECT name FROM sqlite_master WHERE type='table';
PRAGMA table_info(university_rankings);

SELECT COUNT(*) AS total_rows FROM university_rankings;

SELECT year, COUNT(*) AS num_universities
FROM university_rankings
GROUP BY year
ORDER BY year;

SELECT country, COUNT(*) AS num_univerÍsities
FROM university_rankings
GROUP BY country
ORDER BY num_universities DESC
LIMIT 5;

SELECT AVG(score) AS avg_score FROM university_rankings;

SELECT world_rank, institution, country, score
FROM university_rankings
WHERE year = 2014
ORDER BY world_rank ASC
LIMIT 10;