# Camada Gold

Esta pasta representa a Camada Gold do projeto, onde são armazenadas as tabelas analíticas finais, já agregadas e prontas para consumo em visualizações ou consultas.

Assim como nas camadas Bronze e Silver, **os dados finais não são versionados no GitHub**, pois podem ser grandes e são totalmente reprodutíveis a partir dos notebooks do pipeline.

## Tabelas geradas na Gold (via notebooks)

As principais tabelas criadas nesta camada são:

### • `attrition_por_departamento`
Contém a taxa de attrition calculada para cada departamento da empresa.

### • `attrition_por_faixa_salarial`
Apresenta a taxa de attrition segmentada por faixa salarial (alta, média, baixa).

### • `attrition_por_faixa_etaria`
Exibe a taxa de attrition por grupos etários (jovem, adulto, sênior).

### • `attrition_por_genero`
Mostra as diferenças de attrition entre homens e mulheres.

### • `attrition_por_cargo`
Traz a taxa de attrition para cada `jobrole`.

### • `attrition_por_tempo_empresa`
Apresenta a taxa de attrition segmentada por tempo de empresa (`yearsatcompany`).

### • Tabela Consolidada
Também é gerado um dataframe consolidando todas as métricas-chave da Gold, útil para exportações e dashboards.

## Reprodutibilidade

A camada Gold pode ser totalmente reconstruída executando o notebook:

- `notebooks/03_gold_analytics.ipynb`

Nenhum arquivo desta camada é enviado ao repositório, mantendo o GitHub limpo e organizado.
