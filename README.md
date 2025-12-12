# MVP – Pipeline de Dados para Análise de Turnover  
Pós-graduação em Data Science & Machine Learning – PUC Rio Digital

---

## 📌 Visão Geral

Este projeto consiste na construção de um **pipeline completo de dados em nuvem** (Bronze → Silver → Gold), utilizando **Databricks + Spark + Delta Lake**, para analisar o fenômeno de **turnover (attrition)** de colaboradores a partir do dataset público *IBM HR Analytics Employee Attrition*.

O trabalho segue rigorosamente as diretrizes da instituição, contendo:  
- definição de objetivos antes da coleta  
- pipeline estruturado  
- análise de qualidade dos dados  
- modelagem dimensional (Esquema Estrela)  
- análises da camada Gold  
- documentação completa em `/docs`

---

## 📂 Estrutura do Repositório

```
mvp-turnover-databricks/
│
├── data/
│   ├── bronze/   # Dados brutos (CSV + README)
│   ├── silver/   # Dados tratados e padronizados (Delta + README)
│   └── gold/     # Tabelas analíticas finais (Delta + README)
│
├── docs/
│   ├── 01_objetivo.md
│   ├── 02_origem_dados.md
│   ├── 03_data_dictionary.md
│   ├── 04_modelagem.md
│   ├── 05_qualidade_dados.md
│   ├── 06_analises_gold.md
│   ├── 07_conclusao_final.md
│   └── 08_autoavaliacao.md
│
├── notebooks/
│   ├── 00_setup_spark_delta.ipynb
│   ├── 01_ingestao_bronze_ibm_hr_analytics.ipynb
│   ├── 02_silver_transform_ibm_hr_analytics.ipynb
│   └── 03_gold_analytics_ibm_hr_analytics.ipynb
│
├── sql/
│   ├── 01_exploracao_inicial.sql
│   ├── 02_silver_qualidade.sql
│   └── 03_analises_gold.sql
│
└── imgs/
    └── evidências das análises (gráficos, prints)
```

---

## 🎯 Objetivo do MVP

Construir um pipeline de dados moderno em Databricks capaz de:

1. Ingerir, transformar e modelar dados de RH em múltiplas camadas.  
2. Avaliar a qualidade dos dados e corrigir inconsistências.  
3. Estruturar um modelo analítico em **Esquema Estrela**.  
4. Responder às perguntas de negócio relacionadas ao turnover.  
5. Gerar visualizações e métricas consolidadas na camada Gold.  
6. Documentar de forma completa todas as etapas exigidas pela instituição.

**Documento oficial do objetivo:**  
👉 [`docs/01_objetivo.md`](docs/01_objetivo.md)

---

## ❓ Perguntas de Negócio (antes da ingestão)

Alguns exemplos:

- Qual é a taxa geral de turnover?  
- Turnover varia por faixa etária, gênero, cargo ou departamento?  
- Funcionários de baixa renda têm maior risco de desligamento?  
- Os primeiros anos de empresa apresentam maior probabilidade de saída?  
- Quais variáveis mais se correlacionam com o desligamento?  

Todas as perguntas estão formalmente listadas em:  
👉 [`docs/01_objetivo.md`](docs/01_objetivo.md)

---

## 🗄 Base de Dados

**IBM HR Analytics Employee Attrition (Kaggle)**  
Dados abertos, sem restrições de uso educacional.

Detalhamento completo:  
👉 [`docs/02_origem_dados.md`](docs/02_origem_dados.md)

---

## 🧱 Arquitetura do Pipeline (Bronze → Silver → Gold)

A arquitetura segue o padrão Lakehouse:

### **Bronze**
- CSV original
- Conversão para Delta
- Nenhuma transformação

### **Silver**
- Padronização de colunas
- Criação de variáveis derivadas:
  - `faixa_etaria`
  - `faixa_salarial`
- Análise de qualidade (nulos, duplicados, outliers, cardinalidade)
- Base preparada para análise

### **Gold**
- Tabelas analíticas agregadas:
  - attrition por departamento
  - faixa salarial
  - faixa etária
  - gênero
  - job level
  - job role
  - tempo de empresa
- Consolidação de KPIs

Detalhamento da modelagem dimensional:  
👉 [`docs/04_modelagem.md`](docs/04_modelagem.md)

---

## 📊 Principais Resultados

### ✔ Taxa Geral de Turnover
**16.12%**

### ✔ Maiores Departamentos de Risco
| Departamento | Attrition (%) |
|--------------|---------------|
| Sales | 20.63 |
| Human Resources | 19.05 |
| Research & Development | 13.84 |

### ✔ Turnover por Faixa Salarial
| Faixa | Attrition (%) |
|-------|---------------|
| baixa | 28.61 |
| média | 12.03 |
| alta | 10.8 |

### ✔ Turnover por Faixa Etária
| Faixa | Attrition (%) |
|-------|---------------|
| jovem | 27.91 |
| adulto | 12.67 |
| senior | 13.29 |

### ✔ Variáveis mais correlacionadas (ainda que fraco)
- distancefromhome  
- numcompaniesworked  
- monthlyrate  

Análises completas:  
👉 [`docs/06_analises_gold.md`](docs/06_analises_gold.md)

---

## 🧪 Qualidade dos Dados

A base apresenta:

- Sem valores nulos relevantes  
- Nenhum duplicado  
- Outliers coerentes com contexto  
- Cardinalidade adequada nas categóricas  
- Target balanceado (16% attrition)

Detalhamento completo:  
👉 [`docs/05_qualidade_dados.md`](docs/05_qualidade_dados.md)

---

## 📝 Conclusão Geral

O pipeline implementado permitiu:

- Organizar dados brutos em uma arquitetura robusta  
- Extrair insights reais sobre fatores de desligamento  
- Demonstrar domínio de Spark, Delta Lake, ETL e análise de dados  
- Responder todas as perguntas de negócio definidas previamente  

Conclusão completa:  
👉 [`docs/07_conclusao_final.md`](docs/07_conclusao_final.md)

---

## 🧑‍🎓 Autoavaliação

Inclui:

- Pontos fortes  
- Dificuldades encontradas  
- Possíveis melhorias futuras  

👉 [`docs/08_autoavaliacao.md`](docs/08_autoavaliacao.md)

