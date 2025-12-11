-- 01_exploracao_inicial.sql
-- Exploração inicial da base IBM HR Attrition em SQL

-- Contagem total de registros
SELECT COUNT(*) AS total_funcionarios
FROM bronze_ibm_hr;

-- Distribuição da variável target (Attrition)
SELECT Attrition, COUNT(*) AS qtd
FROM bronze_ibm_hr
GROUP BY Attrition;

-- Contagem de valores nulos por coluna
SELECT
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS null_department,
    SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS null_jobrole
FROM bronze_ibm_hr;

-- Estatísticas descritivas (exemplo para três variáveis numéricas)
SELECT
    MIN(Age) AS idade_min,
    MAX(Age) AS idade_max,
    AVG(Age) AS idade_media,
    MIN(MonthlyIncome) AS renda_min,
    MAX(MonthlyIncome) AS renda_max,
    AVG(MonthlyIncome) AS renda_media
FROM bronze_ibm_hr;
