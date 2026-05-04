-- =====================================================================================
-- NYC RESTUARANT INSPECTION ANALYSIS PROJECT 
-- =====================================================================================

-- Dataset: NYC Restuarant Inspection Data
-- Tools: MYSQL Workbench, Python(pandas)
-- Objective: Analyse inspection patterns , violations trends, and business performance 
-- Rows: 285,000+
-- Database: nyc_project
-- Table: inspections_clean
-- ======================================================================================


use nyc_project;
describe nyc_project.inspections_clean;

## checking missing business names. 

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN DBA IS NULL THEN 1 ELSE 0 END) AS missing_business
FROM nyc_Project.inspections_clean;

## most common violations 

SELECT violation_code, COUNT(*) AS frequency
FROM nyc_Project.inspections_clean
GROUP BY violation_code
ORDER BY frequency DESC 
limit 10;

## top businesses by inspections 

SELECT DBA, COUNT(*) AS inspections
FROM nyc_Project.inspections_clean
GROUP BY DBA
ORDER BY inspections DESC
LIMIT 10;


# TOP VIOLATIONS 

SELECT violation_code, COUNT(*) AS frequency
FROM nyc_Project.inspections_clean
GROUP BY violation_code
ORDER BY frequency DESC
limit 10;

# BOROUGH COMPARISON

SELECT borough, COUNT(*) AS inspections
FROM nyc_Project.inspections_clean
GROUP BY borough
ORDER BY inspections DESC;

# WORST RATED BUSINESSES 

SELECT DBA, AVG(score) AS avg_score
FROM nyc_Project.inspections_clean
GROUP BY DBA
ORDER BY avg_score DESC;       ## highest score = worst score in NYC system 

-- ===========================================================================================
-- Key Insights
-- ===========================================================================================

-- 1. Most inspected businesses identified usind DBA field 
-- 2. Most common violations extracted using violation_code 
-- 3. Borough-level inspection distribution analyzed 
-- 4. Dataset successfully cleaned and loaded into MYSQL
-- ===========================================================================================
-- FINAL SUMMARY
-- The dataset was succefully cleaned and analyzed using SQL queries to extract meaningful insights about restaurant inspection trends in NYC.
