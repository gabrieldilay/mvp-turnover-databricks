-- 02_silver_qualidade.sql
-- Análises de Qualidade dos Dados na Camada Silver

-- Contagem total de registros
SELECT COUNT(*) AS total_linhas
FROM silver_ibm_hr;

-- Contagem de duplicados (considerando todas as colunas)
SELECT COUNT(*) AS duplicados
FROM (
    SELECT *, COUNT(*) OVER (PARTITION BY *) AS qtd
    FROM silver_ibm_hr
) t
WHERE qtd > 1;

-- Contagem de nulos por coluna
SELECT
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS null_monthlyincome,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS null_department,
    SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS null_jobrole,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS null_attrition
FROM silver_ibm_hr;

-- Cardinalidade das colunas categóricas
SELECT 'Department' AS coluna, COUNT(DISTINCT Department) AS cardinalidade
FROM silver_ibm_hr
UNION ALL
SELECT 'JobRole', COUNT(DISTINCT JobRole)
FROM silver_ibm_hr
UNION ALL
SELECT 'Gender', COUNT(DISTINCT Gender)
FROM silver_ibm_hr
UNION ALL
SELECT 'MaritalStatus', COUNT(DISTINCT MaritalStatus)
FROM silver_ibm_hr;

-- Estatísticas de variáveis numéricas
SELECT
    MIN(Age) AS idade_min,
    MAX(Age) AS idade_max,
    AVG(Age) AS idade_media,
    MIN(MonthlyIncome) AS renda_min,
    MAX(MonthlyIncome) AS renda_max,
    AVG(MonthlyIncome) AS renda_media,
    MIN(YearsAtCompany) AS anos_empresa_min,
    MAX(YearsAtCompany) AS anos_empresa_max,
    AVG(YearsAtCompany) AS anos_empresa_media
FROM silver_ibm_hr;
