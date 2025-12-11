# Notebooks do MVP – Pipeline de Turnover (Attrition)

Este diretório contém os notebooks utilizados para construção do pipeline de dados em nuvem e das análises de turnover (attrition) com base no dataset público **IBM HR Analytics Employee Attrition & Performance**.

Os notebooks seguem a arquitetura em camadas (Bronze, Silver e Gold) e estão organizados em ordem de execução.

---

## 1. Lista de Notebooks

### `00_setup_spark_delta.ipynb`
Notebook responsável pela configuração do ambiente Spark com suporte ao Delta Lake.

Principais pontos:
- Criação da SparkSession com as extensões do Delta.
- Configuração de catálogo e integração com Delta Lake.
- Verificação básica do contexto Spark (versão, appName, etc.).

---

### `01_ingestao_bronze_ibm_hr_analytics.ipynb`
Notebook da **camada Bronze**.

Principais objetivos:
- Ler o arquivo de origem (`WA_Fn-UseC_-HR-Employee-Attrition.csv`).
- Realizar a ingestão inicial dos dados brutos.
- Persistir a base em formato Delta na pasta `data/bronze/delta_ibm_hr`.
- Exibir amostra dos dados e esquema inicial da tabela Bronze.

---

### `02_silver_transform_ibm_hr_analytics.ipynb`
Notebook da **camada Silver**.

Principais objetivos:
- Carregar a tabela Bronze em formato Delta.
- Padronizar colunas do tipo string (trim, lower).
- Criar colunas derivadas, como:
  - `faixa_salarial` (baixa, média, alta) a partir de `monthlyincome`.
  - `faixa_etaria` (jovem, adulto, sênior) a partir de `age`.
- Realizar análise de qualidade dos dados:
  - Contagem de valores nulos.
  - Contagem de duplicados.
  - Distribuição da variável target (`Attrition`).
  - Estatísticas descritivas para variáveis numéricas.
  - Detecção simples de outliers (Regra do IQR).
  - Verificação da cardinalidade de colunas categóricas.
- Persistir a tabela Silver em formato Delta em `data/silver/delta_ibm_hr_silver`.

---

### `03_gold_analytics_ibm_hr_analytics.ipynb`
Notebook da **camada Gold** e das análises de negócio.

Principais objetivos:
- Carregar a tabela Silver.
- Calcular a taxa geral de attrition da base.
- Calcular taxas de attrition segmentadas por:
  - Departamento (`department`).
  - Faixa salarial (`faixa_salarial`).
  - Faixa etária (`faixa_etaria`).
  - Gênero (`gender`).
  - Nível hierárquico (`joblevel`).
  - Tempo de empresa (`yearsatcompany`).
  - Função (`jobrole`).
- Consolidar métricas em um DataFrame único de indicadores.
- Gerar visualizações em Python (matplotlib) para:
  - Attrition por departamento.
  - Attrition por faixa salarial.
  - Attrition por faixa etária.
- Calcular correlação entre `attrition_flag` (0/1) e variáveis numéricas, destacando as variáveis mais relacionadas ao desligamento.
- Produzir a interpretação dos resultados, alinhada às perguntas de negócio definidas no objetivo do MVP.

---

## 2. Ordem de Execução Recomendada

1. `00_setup_spark_delta.ipynb`
2. `01_ingestao_bronze_ibm_hr_analytics.ipynb`
3. `02_silver_transform_ibm_hr_analytics.ipynb`
4. `03_gold_analytics_ibm_hr_analytics.ipynb`

Cada notebook possui células de texto explicando o objetivo da etapa e o resultado esperado, facilitando a correlação com a documentação da pasta `docs/`.

---

## 3. Requisitos de Ambiente

Os notebooks foram desenvolvidos em ambiente compatível com **Apache Spark** e **Delta Lake**:

- Python 3.x
- `pyspark`
- `delta-spark`
- `matplotlib` (para gráficos)
- Execução recomendada em:
  - Databricks Community Edition, ou
  - Ambiente local com Jupyter Notebook e instalação de `delta-spark`.

---

## 4. Relação com a Documentação

Os notebooks implementam tecnicamente o que está descrito nos arquivos da pasta `docs/`:

- Objetivo do MVP: `docs/01_objetivo.md`
- Origem e coleta dos dados: `docs/02_origem_dados.md`
- Catálogo de dados: `docs/03_data_dictionary.md`
- Modelagem e esquema estrela: `docs/04_modelagem.md`
- Qualidade de dados: `docs/05_qualidade_dados.md`
- Análises da camada Gold: `docs/06_analises_gold.md`
- Conclusão final: `docs/07_conclusao_final.md`
- Autoavaliação: `docs/08_autoavaliacao.md`
