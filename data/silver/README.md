# Camada Silver

Esta pasta representa a Camada Silver do projeto, responsável por armazenar os dados já tratados e padronizados.

Os arquivos desta camada **não são versionados no GitHub**, pois são gerados automaticamente pelos notebooks de transformação em formato de arquivos de análise (por exemplo, Delta Lake ou Parquet), podendo ocupar grande volume de armazenamento.

## Dados armazenados na Silver (gerados via notebooks)

Principais tratamentos realizados no dataframe `df_silver`:

- Conversão de colunas do tipo texto para minúsculas (`lower`) e remoção de espaços extras (`trim`)
- Padronização de categorias (ex.: `attrition`, `department`, `jobrole`, etc.)
- Criação das variáveis derivadas:
  - `faixa_salarial` (baixa, média, alta)
  - `faixa_etaria` (jovem, adulto, sênior)
- Análises auxiliares de:
  - valores nulos
  - duplicidades
  - outliers (regra do IQR)
  - cardinalidade das colunas categóricas

A camada Silver pode ser reconstruída executando o notebook:

- `notebooks/02_silver_transformations.ipynb`
