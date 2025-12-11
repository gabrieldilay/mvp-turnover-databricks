-- 03_analises_gold.sql
-- Consultas analíticas de turnover (Camada Gold)

-------------------------------------------------------
-- 1. Taxa geral de Attrition
-------------------------------------------------------
SELECT 
    COUNT(*) AS total_funcionarios,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS total_desligados,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
    2) AS taxa_attrition_percentual
FROM silver_ibm_hr;


-------------------------------------------------------
-- 2. Attrition por Departamento
-------------------------------------------------------
SELECT
    department,
    COUNT(*) AS qtd_total,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS qtd_saiu,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS taxa_attrition
FROM silver_ibm_hr
GROUP BY department
ORDER BY taxa_attrition DESC;


-------------------------------------------------------
-- 3. Attrition por Faixa Salarial
-- (Assumindo que a coluna faixa_salarial já foi criada na Silver)
-------------------------------------------------------
SELECT
    faixa_salarial,
    COUNT(*) AS qtd_total,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS qtd_saiu,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS taxa_attrition
FROM silver_ibm_hr
GROUP BY faixa_salarial
ORDER BY taxa_attrition DESC;


-------------------------------------------------------
-- 4. Attrition por Faixa Etária
-- (Assumindo que a coluna faixa_etaria já foi criada na Silver)
-------------------------------------------------------
SELECT
    faixa_etaria,
    COUNT(*) AS qtd_total,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS qtd_saiu,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS taxa_attrition
FROM silver_ibm_hr
GROUP BY faixa_etaria
ORDER BY taxa_attrition DESC;


-------------------------------------------------------
-- 5. Attrition por Gênero
-------------------------------------------------------
SELECT
    gender,
    COUNT(*) AS qtd_total,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS qtd_saiu,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS taxa_attrition
FROM silver_ibm_hr
GROUP BY gender
ORDER BY taxa_attrition DESC;


-------------------------------------------------------
-- 6. Attrition por Cargo (Job Role)
-------------------------------------------------------
SELECT
    jobrole,
    COUNT(*) AS qtd_total,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS qtd_saiu,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS taxa_attrition
FROM silver_ibm_hr
GROUP BY jobrole
ORDER BY taxa_attrition DESC;


-------------------------------------------------------
-- 7. Attrition por Nível Hierárquico (JobLevel)
-------------------------------------------------------
SELECT
    joblevel,
    COUNT(*) AS qtd_total,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS qtd_saiu,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS taxa_attrition
FROM silver_ibm_hr
GROUP BY joblevel
ORDER BY joblevel;


-------------------------------------------------------
-- 8. Attrition por Tempo de Empresa (YearsAtCompany)
-------------------------------------------------------
SELECT
    yearsatcompany,
    COUNT(*) AS qtd_total,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS qtd_saiu,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS taxa_attrition
FROM silver_ibm_hr
GROUP BY yearsatcompany
ORDER BY yearsatcompany;


-------------------------------------------------------
-- 9. Correlação aproximada (visão descritiva)
-- Aqui não é correlação estatística direta, mas uma forma de
-- observar tendência de attrition em função de variáveis numéricas.
-------------------------------------------------------

-- Exemplo: distribuição de attrition por faixas de distância de casa
SELECT
    CASE 
        WHEN distancefromhome <= 5 THEN '0-5 km'
        WHEN distancefromhome <= 10 THEN '6-10 km'
        WHEN distancefromhome <= 20 THEN '11-20 km'
        ELSE '21+ km'
    END AS faixa_distancia,
    COUNT(*) AS qtd_total,
    SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) AS qtd_saiu,
    ROUND(
        SUM(CASE WHEN attrition = 'yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*),
    2) AS taxa_attrition
FROM silver_ibm_hr
GROUP BY
    CASE 
        WHEN distancefromhome <= 5 THEN '0-5 km'
        WHEN distancefromhome <= 10 THEN '6-10 km'
        WHEN distancefromhome <= 20 THEN '11-20 km'
        ELSE '21+ km'
    END
ORDER BY taxa_attrition DESC;
