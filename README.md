# MVP – Pipeline de Dados para Análise de Turnover  
### Pós-graduação em Data Science & Machine Learning – PUC Rio Digital
### Aluno: Gabriel Dilay de Oliveira
### Matrícula: 4052025001828

---

## Sumário
1. [Objetivo do Trabalho](#objetivo-do-trabalho)  
2. [Perguntas de Negócio](#perguntas-de-negócio)  
3. [Base de Dados Utilizada](#base-de-dados-utilizada)  
4. [Coleta dos Dados](#coleta-dos-dados)  
5. [Modelagem das Camadas (Bronze, Silver e Gold)](#modelagem-das-camadas-bronze-silver-e-gold)  
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

O objetivo deste MVP é construir um pipeline de dados em camadas (Bronze, Silver e Gold), utilizando processamento distribuído com Apache Spark e Delta Lake, para analisar os fatores associados ao turnover (attrition) em uma base de dados de Recursos Humanos.

O estudo tem como foco responder perguntas de negócio definidas previamente, conforme as diretrizes da PUC Rio Digital, demonstrando domínio técnico, capacidade analítica e organização metodológica ao longo de todo o pipeline.

---

## Perguntas de Negócio

1. Qual é a taxa geral de turnover da empresa?  
2. Quais departamentos apresentam maior rotatividade?  
3. Há diferenças de attrition por faixa etária, gênero e nível hierárquico?  
4. Funcionários com mais anos de empresa apresentam menor probabilidade de desligamento?  
5. Quais variáveis numéricas apresentam maior correlação com o desligamento?  
6. Existe relação entre faixa salarial e attrition?  
7. O turnover varia entre cargos (job roles)?  
8. Os primeiros anos de empresa concentram maior risco de saída?  
9. É possível identificar perfis críticos de risco de desligamento?  

---

## Base de Dados Utilizada

- **Dataset:** IBM HR Analytics Employee Attrition & Performance  
- **Origem:** Kaggle  
- **Licença:** Livre para uso educacional  

---

## Coleta dos Dados

A coleta foi realizada por meio do download manual do arquivo CSV disponibilizado publicamente.  
Em seguida, o dataset foi carregado na camada Bronze e convertido para o formato Delta Lake, viabilizando o processamento distribuído e as etapas subsequentes do pipeline.

---

## Modelagem das Camadas (Bronze, Silver e Gold)

### Camada Bronze
- Armazena os dados brutos.
- Nenhuma transformação aplicada.
- Conversão do CSV original para Delta Lake.

### Camada Silver
- Padronização de colunas categóricas (`trim`, `lower`).
- Criação de variáveis derivadas:
  - `faixa_etaria`
  - `faixa_salarial`
- Análise de qualidade de dados:
  - valores nulos
  - duplicados
  - cardinalidade
  - outliers (regra do IQR)
  - distribuição da variável target (attrition)

### Camada Gold
- Cálculo das métricas analíticas de negócio:
  - turnover geral
  - turnover por departamento, gênero, nível hierárquico, faixa etária, faixa salarial e tempo de empresa
  - análise de correlação com variáveis numéricas
- Consolidação de KPIs.
- Geração de tabelas analíticas e visualizações.

---

## Catálogo de Dados

| Coluna | Tipo | Descrição |
|------|------|-----------|
| age | int | Idade do colaborador |
| monthlyincome | double | Renda mensal |
| department | string | Departamento |
| jobrole | string | Cargo |
| joblevel | int | Nível hierárquico |
| attrition | string | Indica desligamento (yes/no) |
| yearsatcompany | int | Tempo de empresa |
| faixa_etaria | string | Faixa etária derivada |
| faixa_salarial | string | Faixa salarial derivada |

---

## Pipeline de ETL

1. Carregamento do CSV bruto na camada Bronze  
2. Conversão para tabela Delta  
3. Inicialização do Spark com suporte a Delta Lake  
4. Padronização e limpeza dos dados  
5. Criação de colunas derivadas  
6. Análise de qualidade dos dados  
7. Escrita da camada Silver  
8. Cálculo das métricas de negócio  
9. Escrita da camada Gold  
10. Consolidação dos KPIs  
11. Geração de análises e visualizações  

---

## Qualidade dos Dados

- **Valores nulos:** inexistentes ou irrelevantes  
- **Duplicados:** nenhum duplicado identificado  
- **Outliers:** presentes em renda e tempo de empresa, compatíveis com o contexto de RH  
- **Cardinalidade:** adequada para análise  
- **Distribuição do target:** aproximadamente 16% de attrition  

A base foi considerada apropriada para as análises propostas.

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
- Primeiro ano: **36.5%**  
- Redução progressiva após os três primeiros anos

### Turnover por Função
Funções com maior risco:
- Laboratory Technician  
- Human Resources  
- Sales Representative  

### Correlação
As variáveis numéricas apresentaram correlação fraca (< 0.1), indicando maior influência de fatores comportamentais e organizacionais.

---

## Discussão dos Resultados

Os resultados indicam maior turnover entre:
- colaboradores jovens,
- profissionais de baixa renda,
- funcionários em início de carreira,
- cargos e departamentos operacionais,
- níveis hierárquicos iniciais.

Esses achados reforçam a importância de políticas de retenção focadas em remuneração, onboarding estruturado e desenvolvimento de carreira nos primeiros anos.

---

## Conclusão Final

O pipeline Bronze → Silver → Gold demonstrou ser eficaz na transformação de dados brutos em inteligência analítica acionável.  
O MVP atingiu plenamente seus objetivos ao identificar padrões claros de turnover e fornecer evidências relevantes para apoio à tomada de decisão.

Entre as principais recomendações estão:
- revisão de políticas salariais,
- fortalecimento do onboarding,
- ações específicas em cargos e departamentos críticos,
- estratégias de retenção voltadas a profissionais em início de carreira.

---

## Autoavaliação

A autoavaliação completa do projeto está documentada em arquivo específico, conforme exigido pela disciplina.

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
```

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
