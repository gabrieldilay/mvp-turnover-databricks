# MVP – Pipeline de Dados para Análise de Turnover  
### Pós-graduação em Data Science & Machine Learning – PUC Rio Digital

---

## Sumário
1. [Objetivo do Trabalho](#objetivo-do-trabalho)  
2. [Perguntas de Negócio](#perguntas-de-negócio)  
3. [Base de Dados Utilizada](#base-de-dados-utilizada)  
4. [Coleta dos Dados](#coleta-dos-dados)  
5. [Modelagem das Camadas (Bronze, Silver, Gold)](#modelagem-das-camadas-bronze-silver-gold)  
6. [Catálogo de Dados](#catálogo-de-dados)  
7. [Pipeline de ETL](#pipeline-de-etl)  
8. [Qualidade dos Dados](#qualidade-dos-dados)  
9. [Principais Resultados](#principais-resultados)  
10. [Discussão dos Resultados](#discussão-dos-resultados)  
11. [Conclusão Final](#conclusão-final)  
12. [Autoavaliação](#autoavaliação)  
13. [Como Executar o Projeto](#como-executar-o-projeto)  
14. [Documentação Completa](#documentação-completa)  
15. [Licença](#licença)

---

## Objetivo do Trabalho

O objetivo deste MVP é construir um pipeline de dados em camadas (Bronze, Silver e Gold), utilizando processamento distribuído com Spark e Delta Lake, para analisar fatores associados ao turnover (attrition) em uma base de Recursos Humanos.  
O estudo visa responder perguntas de negócio definidas previamente, conforme exigido pela instituição.

---

## Perguntas de Negócio

1. Qual é o turnover total da empresa?  
2. Quais departamentos possuem maior rotatividade?  
3. Há diferenças de attrition por faixa etária, gênero e nível hierárquico?  
4. Funcionários com mais anos de empresa saem menos?  
5. Quais variáveis numéricas têm maior correlação com o desligamento?  
6. Há relação entre salário e attrition?  
7. O turnover varia entre cargos (job roles)?  
8. Os primeiros anos de empresa possuem maior risco de saída?  
9. É possível identificar perfis críticos de risco?  

---

## Base de Dados Utilizada

Dataset: **IBM HR Analytics Employee Attrition & Performance**  
Origem: Kaggle  
Licença: Livre para uso educacional

---

## Coleta dos Dados

A coleta foi realizada via download manual do arquivo CSV.  
Em seguida, o arquivo foi carregado na camada Bronze e convertido para Delta Lake.

---

## Modelagem das Camadas (Bronze, Silver, Gold)

### Bronze
- Dados brutos
- Sem transformações
- Conversão CSV → Delta

### Silver
- Padronizações: `trim`, `lower`
- Criação das variáveis derivadas:
  - `faixa_etaria`
  - `faixa_salarial`
- Análise de qualidade:
  - nulos
  - duplicados
  - cardinalidade
  - outliers (IQR)
  - distribuição do target

### Gold
- Cálculo das métricas analíticas:
  - turnover geral
  - turnover por segmento (departamento, gênero, job level, idade, renda, tempo de empresa)
  - correlação com variáveis numéricas
- Consolidação de KPIs
- Geração das visualizações

---

## Catálogo de Dados

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| age | int | Idade |
| monthlyincome | double | Renda mensal |
| department | string | Departamento |
| jobrole | string | Cargo |
| joblevel | int | Nível hierárquico |
| attrition | string | Desligamento (yes/no) |
| yearsatcompany | int | Tempo de empresa |
| faixa_etaria | string | Faixa etária derivada |
| faixa_salarial | string | Faixa salarial derivada |

---

## Pipeline de ETL

1. Carregar CSV bruto → Bronze  
2. Criar tabela Delta  
3. Inicializar Spark + Delta  
4. Aplicar padronizações e limpeza  
5. Criar colunas derivadas  
6. Realizar análise de qualidade  
7. Salvar Silver  
8. Calcular métricas de negócio  
9. Salvar Gold  
10. Consolidar KPIs  
11. Gerar análises e gráficos  

---

## Qualidade dos Dados

- **Nulos:** inexistentes ou irrelevantes  
- **Duplicados:** nenhum duplicado encontrado  
- **Outliers:** presentes em renda e tempo, compatíveis com contexto  
- **Cardinalidade:** adequada  
- **Balanceamento:** 16% attrition geral  

---

## Principais Resultados

### Turnover Geral  
**16.12%**

### Turnover por Departamento
| Departamento | Attrition (%) |
|-------------|----------------|
| Sales | 20.63 |
| Human Resources | 19.05 |
| Research & Development | 13.84 |

### Turnover por Faixa Salarial
- Baixa renda: **28.61%**  
- Média renda: **12.03%**  
- Alta renda: **10.8%**

### Turnover por Faixa Etária
- Jovens: **27.91%**  
- Adultos: **12.67%**  
- Seniores: **13.29%**

### Turnover por Nível de Cargo
- Job Level 1: **26.34%**  
- Níveis superiores: abaixo de 10%

### Turnover por Tempo de Empresa
- 1º ano: **36.5%**  
- Redução gradual após 3 anos

### Turnover por Função
Top 3:
- Laboratory Technician  
- Human Resources  
- Sales Representative  

### Correlação
Variáveis numéricas apresentam correlação fraca (< 0.1) — indicando influência maior de fatores comportamentais e organizacionais.

---

## Discussão dos Resultados

Os achados mostram que turnover é mais elevado em:
- funcionários jovens,  
- com baixa renda,  
- nos primeiros anos de empresa,  
- em departamentos e funções operacionais,  
- em níveis de entrada.

As análises indicam a necessidade de políticas de retenção com foco em remuneração, onboarding e valorização dos talentos em início de carreira.

---

## Conclusão Final

O pipeline Bronze → Silver → Gold permitiu transformar dados brutos em inteligência analítica real.  
O MVP atingiu seu objetivo ao identificar padrões claros de desligamento e fornecer evidências acionáveis.

Recomendações:
- ajustar políticas salariais para faixas de maior risco  
- reforçar onboarding  
- atuar preventivamente em cargos operacionais  
- direcionar ações específicas para departamentos críticos  

---

## Autoavaliação

### Pontos fortes
- Pipeline completo e funcional  
- Documentação detalhada  
- Análise robusta e conectada às perguntas de negócio  
- Estrutura profissional do repositório  

### Dificuldades
- Ajustes em funções PySpark  
- Necessidade de padronizações adicionais na Silver  

### Melhorias futuras
- Criar modelo preditivo de churn  
- Desenvolver dashboard interativo  
- Orquestrar pipeline com Airflow  
- Incorporar novas variáveis  

---

## Como Executar o Projeto

### 1. Execução local (Jupyter Notebook)

```bash
git clone https://github.com/gabrieldilay/mvp-turnover-databricks.git
cd mvp-turnover-databricks
Executar notebooks nesta ordem:
notebooks/00_setup_spark_delta.ipynb
notebooks/01_ingestao_bronze_ibm_hr_analytics.ipynb
notebooks/02_silver_transform_ibm_hr_analytics.ipynb
notebooks/03_gold_analytics_ibm_hr_analytics.ipynb


## Documentação Completa

| Descrição | Arquivo |
|-----------|---------|
| Objetivo do MVP | docs/01_objetivo.md |
| Coleta e origem dos dados | docs/02_origem_dados.md |
| Catálogo de dados | docs/03_data_dictionary.md |
| Modelagem dimensional | docs/04_modelagem.md |
| Qualidade dos dados | docs/05_qualidade_dados.md |
| Análises Gold | docs/06_analises_gold.md |
| Conclusão final | docs/07_conclusao_final.md |
| Autoavaliação | docs/08_autoavaliacao.md |
| Referências | docs/09_referencias.md |


## Licença

Este projeto é destinado exclusivamente para fins acadêmicos na PUC Rio Digital.
---
