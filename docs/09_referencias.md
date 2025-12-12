# 9. Referências Bibliográficas

Este documento reúne as principais fontes consultadas durante o desenvolvimento do MVP, incluindo materiais acadêmicos, documentação oficial de tecnologias utilizadas e referências sobre o dataset analisado.

---

## 1. Documentação Oficial

**Apache Spark – Documentation**  
https://spark.apache.org/docs/latest/  
Referência oficial sobre APIs, conceitos de processamento distribuído, DataFrames, otimizações e funções utilizadas no projeto.

**Delta Lake – Documentation**  
https://docs.delta.io/latest/  
Documentação oficial sobre o formato Delta Lake, covering ACID transactions, schema enforcement, time travel e boas práticas de arquitetura Lakehouse.

**PySpark API Reference**  
https://spark.apache.org/docs/latest/api/python/  
Especificação técnica das funções PySpark empregadas no pipeline, como `withColumn`, `groupBy`, `agg`, `when`, `lit`, `approxQuantile`.

**Matplotlib – Official Documentation**  
https://matplotlib.org/stable/contents.html  
Utilizada para geração dos gráficos de visualização na camada Gold.

---

## 2. Base de Dados Utilizada

**IBM HR Analytics Employee Attrition Dataset**  
Disponível gratuitamente em:  
https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset  
Conjunto de dados amplamente utilizado em estudos de turnover em Recursos Humanos. Não possui restrições para uso educacional.

---

## 3. Artigos e Materiais Complementares

**Delta Lake: The Definitive Guide** – Databricks  
Conceitos estruturantes de Lakehouse Architecture aplicados no MVP.

**Building a Data Lakehouse** – Databricks Blog  
Explica a separação de camadas Bronze/Silver/Gold, utilizada como base conceitual do pipeline.

---

## 4. Materiais da Pós-Graduação (PUC Rio Digital)

- *Qualidade de Dados* – fundamentos sobre verificação de nulos, duplicidades, outliers e cardinalidade.
- *Data Lakes, Aquisição, Ingestão e ETL* – base conceitual para ingestão e transformação de dados.
- *Modelagem de Data Warehouses e Esquema Estrela* – conceitos utilizados para a modelagem dimensional da camada Gold.
- *Fundamentos de Banco de Dados e SQL* – operadores, agregações e consultas replicadas em PySpark.

As apostilas PDF disponibilizadas pela instituição foram usadas como referência teórica para a criação do pipeline e da arquitetura de dados.

---

## 5. Outros Recursos Técnicos

**Pandas Documentation**  
https://pandas.pydata.org/docs/  
Utilizado em análises locais complementares, como matriz de correlação.

**NumPy Documentation**  
https://numpy.org/doc/  
Apoio matemático na construção de cálculos estatísticos.

---

## 6. Formatação e Estruturação do Projeto

**Markdown Guide – CommonMark Specification**  
https://spec.commonmark.org/  
Utilizado como referência para padronizar a documentação do repositório.
