## 1. Objetivo do MVP

O objetivo deste MVP é analisar o fenômeno de **turnover (attrition) de funcionários** utilizando a base pública *IBM HR Analytics Employee Attrition & Performance*. A partir da construção de um pipeline de dados em arquitetura Medallion (Bronze, Silver e Gold), buscamos identificar padrões, fatores associados ao desligamento e possíveis oportunidades de melhoria nas práticas de gestão de pessoas.

O trabalho se concentra em responder perguntas de negócio relacionadas ao comportamento de saída dos colaboradores, permitindo que a área de Recursos Humanos compreenda melhor os fatores que influenciam a rotatividade e desenvolva estratégias para mitigá-la.

## 1.1 Perguntas de Negócio

A seguir estão listadas as perguntas que norteiam este estudo. Mesmo que nem todas sejam respondidas integralmente, elas representam o conjunto de investigações desejadas para compreensão do problema de turnover:

1. **Qual é o turnover total da empresa no período analisado?**
2. **Quais departamentos apresentam maior índice de desligamento?**
3. **Existem diferenças de turnover por faixa etária, gênero ou nível hierárquico?**
4. **Funcionários com mais anos de empresa têm maior ou menor probabilidade de desligamento?**
5. **Quais variáveis demonstram maior relação com a chance de saída (correlação)?**
6. **O salário possui relação direta ou inversa com o turnover?**
7. **Turnover está concentrado em determinadas funções (job roles)?**
8. **Há grupos específicos que apresentam maior risco de desligamento (faixa salarial, idade, tempo de casa)?**
9. **Quais padrões observados podem subsidiar ações de retenção e melhorias de RH?**
10. **Quais insights podem apoiar a tomada de decisão da gestão de pessoas?**

Essas perguntas guiam todo o pipeline desenvolvido neste MVP, desde a ingestão e modelagem dos dados até a geração de tabelas analíticas e visualizações na camada Gold.

## 2. Busca e Coleta dos Dados

A base de dados utilizada neste MVP é a *IBM HR Analytics Employee Attrition & Performance*, disponibilizada publicamente no Kaggle. Essa base contém informações de funcionários, incluindo dados demográficos, histórico profissional, remuneração, satisfação e indicador de desligamento (attrition). Trata-se de um conjunto amplamente utilizado para estudos de People Analytics, análise preditiva e modelagem de turnover.

### 2.1 Origem dos Dados

- **Fonte:** Kaggle  
- **Link:** https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset  
- **Licença:** Base pública para uso educacional e analítico (Open Data).  
- **Formato original:** CSV  
- **Tamanho:** ~35 KB  
- **Quantidade de registros:** 1.470 colaboradores  
- **Quantidade de colunas:** 35 atributos

A escolha desta base foi motivada por sua estrutura completa, qualidade das variáveis e ampla aplicação em estudos de rotatividade, permitindo responder às perguntas de negócio definidas na etapa de objetivos.

### 2.2 Processo de Coleta

Por se tratar de um dataset público e estático, não foi necessária a construção de robôs de coleta (web scraping) ou integrações via API. O arquivo CSV foi baixado diretamente da plataforma Kaggle e armazenado no ambiente de processamento local, que neste projeto emula um Data Lake por meio de contêiner Docker com suporte ao Spark e Delta Lake.

### 2.3 Armazenamento na Camada Bronze

Após o download, o arquivo CSV foi movido para o diretório correspondente à **camada Bronze**:
/home/jovyan/data/bronze/WA_Fn-UseC_-HR-Employee-Attrition.csv

A ingestão foi realizada via Spark, convertendo o arquivo CSV em formato Delta, com o objetivo de padronizar o armazenamento, facilitar reprocessamentos e permitir versionamento e mutabilidade.

### 2.4 Considerações sobre Privacidade e Ética

A base utilizada não contém dados sensíveis ou informações pessoais reais. Todos os registros são fictícios e foram criados para fins acadêmicos pela IBM.  
Dessa forma, não há riscos de exposição de dados confidenciais, e o uso está em conformidade com as diretrizes éticas solicitadas pela instituição.

### 2.5 Conclusão da Etapa de Coleta

Com a coleta concluída e os dados corretamente armazenados na camada Bronze, o projeto segue para as etapas de modelagem e transformação, onde os dados serão estruturados e preparados para análise nas camadas Silver e Gold.

## 3. Modelagem dos Dados

A modelagem adotada neste MVP segue a **Arquitetura Medallion** (Bronze → Silver → Gold), amplamente utilizada em Lakehouses modernos e compatível com o Delta Lake. Essa abordagem foi escolhida por ser aderente ao volume e ao formato do dataset, além de permitir uma clara separação entre ingestão, tratamento e análise.

Embora a instituição permita a utilização de modelos em Esquema Estrela ou Snowflake, esses modelos são mais adequados para sistemas de Business Intelligence com múltiplas tabelas relacionais. Como o dataset utilizado é único e possui estrutura tabular plana (flat), a modelagem em camadas Medallion é a escolha mais apropriada.

---

### 3.1 Arquitetura Medallion

A modelagem dos dados foi estruturada em três camadas:

### **Bronze – Dados Brutos**
- Contém o arquivo original extraído do Kaggle, armazenado em formato CSV e posteriormente convertido para Delta.
- Nenhuma transformação é aplicada nesta etapa.
- Objetivo: **preservar a integridade do dado original**.

### **Silver – Dados Tratados e Padronizados**
- Limpeza de colunas string (trim + lower)
- Conversão de tipos
- Criação das colunas derivadas:
  - `faixa_salarial`
  - `faixa_etaria`
  - `attrition_flag`
- Dataset pronto para análises e cálculos estatísticos.

### **Gold – Métricas e Indicadores de Turnover**
- Cálculo da taxa geral de attrition
- Análises segmentadas por:
  - departamento  
  - faixa etária  
  - faixa salarial  
  - gênero  
  - função (job role)  
  - nível hierárquico  
  - tempo de empresa  
  - correlações numéricas  
- Tabelas finais consolidadas para consumo analítico.

---

### 3.2 Diagrama da Arquitetura
    +----------------+
    |     BRONZE     |
    |  Dados brutos  |
    |   (CSV → Delta)|
    +--------+-------+
             |
             v
    +----------------+
    |     SILVER     |
    | Limpeza, tipos |
    | Derivadas      |
    +--------+-------+
             |
             v
    +----------------+
    |      GOLD      |
    | KPIs, análises |
    | métricas finais|
    +----------------+


---

### 3.3 Catálogo de Dados (Silver)

A tabela abaixo descreve os principais atributos utilizados após o tratamento na camada Silver:

| Coluna                | Tipo     | Descrição                                      | Domínio / Exemplo                       |
|----------------------|----------|------------------------------------------------|------------------------------------------|
| age                  | int      | Idade do colaborador                          | 18–60                                    |
| businesstravel       | string   | Frequência de viagens a trabalho              | travel_rarly; travel_frequently; etc.    |
| dailyRate            | int      | Remuneração diária                             | 100–1500                                 |
| department           | string   | Departamento do funcionário                   | sales; human resources; r&d             |
| education            | int      | Nível educacional                             | 1–5                                      |
| educationField       | string   | Campo de formação                             | life sciences; medical; marketing        |
| gender               | string   | Gênero                                        | male; female                              |
| jobLevel             | int      | Nível hierárquico                             | 1–5                                      |
| jobRole              | string   | Função do colaborador                         | laboratory technician, manager, etc.     |
| maritalStatus        | string   | Estado civil                                  | single; married; divorced                 |
| monthlyIncome        | int      | Renda mensal                                  | 1000–20000                                |
| numCompaniesWorked   | int      | Nº de empresas anteriores                      | 0–9                                       |
| percentSalaryHike    | int      | % de aumento salarial                          | 10–25                                     |
| totalWorkingYears    | int      | Anos totais de experiência                     | 0–40                                      |
| trainingTimesLastYear| int      | Nº de treinamentos no último ano              | 0–6                                       |
| yearsAtCompany       | int      | Anos de empresa                                | 0–40                                      |
| yearsInCurrentRole   | int      | Anos no cargo atual                            | 0–18                                      |
| yearsSinceLastPromotion | int  | Anos desde última promoção                     | 0–15                                      |
| attrition            | string   | Indicador de desligamento                     | yes / no                                 |
| attrition_flag       | int      | Variável binária para attrition               | 1 = saiu; 0 = ficou                       |
| faixa_etaria         | string   | Classificação etária                           | jovem; adulto; senior                     |
| faixa_salarial       | string   | Classificação da renda                         | baixa; media; alta                        |

*Observação:* valores mínimos e máximos foram inferidos após leitura dos dados.


### 3.4 Linhagem dos Dados

A linhagem detalha cada etapa pela qual o dado passou:

1. **Origem (Kaggle)**  
   - Arquivo CSV baixado manualmente.  
   - Base pública, fictícia, para fins educacionais.  

2. **Ingestão – Bronze**  
   - Armazenamento como CSV no diretório do Data Lake local.  
   - Conversão para Delta Lake sem transformações.  

3. **Transformação – Silver**  
   - Padronização das colunas string.  
   - Conversão de tipos.  
   - Criação de colunas derivadas.  

4. **Consumo Analítico – Gold**  
   - KPIs e métricas calculadas com Spark.  
   - Geração das tabelas analíticas finais em Delta.  

---

### 3.5 Justificativa da Modelagem

A arquitetura Medallion foi escolhida porque:

- É amplamente utilizada em ambientes Lakehouse (Databricks, Delta Lake).  
- Separa o dado bruto, o dado tratado e o dado analítico.  
- Facilita reprocessamentos e auditoria.  
- Atende perfeitamente ao escopo do projeto, que possui apenas uma tabela flat.

Modelagem dimensional (fato e dimensão) não é necessária, pois:

- O dataset não apresenta múltiplas entidades relacionadas.  
- Não há joins complexos.  
- O objetivo é analítico, não relacional.

```markdown
---

## ✔ SEÇÃO 3 concluída com sucesso.
Essa seção sozinha vale **2 pontos da prova** (modelagem + catálogo de dados).

## 4. Pipeline de ETL (Bronze → Silver → Gold)

O pipeline de dados deste MVP foi desenvolvido utilizando Apache Spark e Delta Lake, executados em um ambiente Docker com Jupyter Notebook. A lógica segue a arquitetura em camadas (Medallion), separando claramente ingestão, tratamento e análise.

Todo o fluxo está implementado em três notebooks principais:

- `01_ingestao_bronze_ibm_hr_analytics.ipynb`
- `02_silver_transform_ibm_hr_analytics.ipynb`
- `03_gold_analytics_ibm_hr_analytics.ipynb`

A seguir, descrevemos cada etapa do ETL.

---

### 4.1 Camada Bronze – Ingestão dos Dados

Notebook: `01_ingestao_bronze_ibm_hr_analytics.ipynb`

Principais passos:

1. Inicialização da sessão Spark com suporte a Delta Lake.
2. Leitura do arquivo CSV original da base IBM HR:
   - Caminho: `/home/jovyan/data/bronze/WA_Fn-UseC_-HR-Employee-Attrition.csv`
   - Opções utilizadas:
     - `header = true`
     - `inferSchema = true`
3. Escrita dos dados em formato Delta:
   - Caminho de saída: `/home/jovyan/data/bronze/delta_ibm_hr`
4. Leitura de validação da tabela Delta para garantir que a ingestão ocorreu corretamente.

Nesta camada, os dados são mantidos o mais próximos possível da forma original, apenas convertidos para um formato otimizado (Delta) para facilitar o processamento nas etapas seguintes.

---

### 4.2 Camada Silver – Tratamento e Enriquecimento

Notebook: `02_silver_transform_ibm_hr_analytics.ipynb`

Principais passos:

1. Leitura da tabela Bronze em formato Delta:
   - Caminho: `/home/jovyan/data/silver/delta_ibm_hr_silver` (fonte: Delta da Bronze).
2. Padronização das colunas do tipo string:
   - Remoção de espaços em branco (`trim`)
   - Conversão para letras minúsculas (`lower`)
3. Criação de colunas derivadas:
   - `faixa_salarial`: categorização da coluna `monthlyincome` em baixa, média e alta.
   - `faixa_etaria`: categorização da coluna `age` em jovem, adulto e senior.
4. Escrita da camada Silver em formato Delta:
   - Caminho de saída: `/home/jovyan/data/silver/delta_ibm_hr_silver`
5. Validação final com `show(5)` e `printSchema()` para garantir a integridade e consistência dos dados tratados.

A camada Silver contém os dados prontos para análise, com tipos adequados, textos padronizados e variáveis derivadas que simplificam as segmentações na camada Gold.

---

### 4.3 Camada Gold – Métricas e Análises de Negócio

Notebook: `03_gold_analytics_ibm_hr_analytics.ipynb`

Principais passos:

1. Leitura da tabela Silver em formato Delta:
   - Caminho: `/home/jovyan/data/silver/delta_ibm_hr_silver`
2. Cálculo de métricas principais de attrition:
   - Taxa geral de attrition.
   - Taxa de attrition por:
     - departamento (`department`)
     - faixa etária (`faixa_etaria`)
     - faixa salarial (`faixa_salarial`)
     - gênero (`gender`)
     - nível hierárquico (`joblevel`)
     - tempo de empresa (`yearsatcompany`)
     - função (`jobrole`)
3. Criação de um DataFrame consolidado com as principais métricas de attrition.
4. Escrita das tabelas Gold em formato Delta:
   - Exemplo de saídas:
     - `/home/jovyan/data/gold/attr_por_departamento`
     - `/home/jovyan/data/gold/attr_por_faixa_salarial`
     - `/home/jovyan/data/gold/attr_por_faixa_etaria`
5. Geração de visualizações com `matplotlib`:
   - Gráficos de barras para:
     - taxa de attrition por departamento
     - taxa de attrition por faixa etária
     - taxa de attrition por faixa salarial
     - taxa de attrition por função

A camada Gold representa o **produto final analítico** do pipeline, consolidando as principais métricas de turnover e fornecendo insumos diretos para interpretação de negócio e tomada de decisão.

---

### 4.4 Resumo do ETL

De forma resumida, o fluxo do pipeline é:

1. **Bronze:** ingestão do CSV original em Delta, sem transformação.
2. **Silver:** tratamento, padronização e criação de variáveis derivadas.
3. **Gold:** cálculo de KPIs, análises segmentadas, consolidação e visualizações.

Esse pipeline atende aos requisitos de ETL definidos pela instituição, ao mesmo tempo em que segue boas práticas modernas de engenharia de dados em arquitetura de dados em camadas.



