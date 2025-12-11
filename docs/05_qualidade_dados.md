# 05. Análise de Qualidade dos Dados

Este documento descreve a análise de qualidade realizada sobre a base de colaboradores utilizada no MVP de turnover.  
Todas as verificações foram conduzidas na camada Silver (`df_silver`), após a ingestão da camada Bronze e aplicação das primeiras padronizações.

---

## 1. Visão geral da base

- Fonte: IBM HR Analytics Employee Attrition & Performance (Kaggle).
- Volume após carga na Silver: **1.470 registros**.
- Unidade de análise: cada linha representa um colaborador único.
- Objetivo da análise de qualidade: verificar se a base é adequada para responder às perguntas de negócio sobre turnover.

---

## 2. Contagem de valores nulos

Foi calculada, para cada coluna, a quantidade de valores:

- `NULL`
- vazios (`""`), no caso de colunas de texto.

Procedimento:

- Uso de expressões `when(col(c).isNull() | (col(c) == ""), 1)` agregadas com `sum` para cada coluna.
- Resultado exibido em um DataFrame com uma linha por coluna e a respectiva contagem de valores nulos/vazios.

Principais achados:

- **Não foram encontrados valores nulos ou vazios relevantes nas colunas da base**, o que indica que o dataset já chega curado do ponto de vista de completude.
- Pequenas variações pontuais não impactaram a análise e não exigiram imputação.

Conclusão desta etapa:

- A base apresenta **boa completude** e não foi necessário aplicar técnicas de preenchimento (imputação) de dados.

---

## 3. Contagem de duplicados

Foi verificada a existência de registros duplicados na tabela, utilizando contagens de:

- total de linhas;
- total de linhas distintas considerando todas as colunas.

Principais achados:

- O número de registros distintos coincide com o total de registros.
- Não foram identificados **duplicados exatos**.

Conclusão desta etapa:

- **Não houve necessidade de remoção de duplicatas**, preservando os 1.470 colaboradores na análise.

---

## 4. Distribuição da variável alvo (Attrition)

A variável de interesse para o estudo é `Attrition`, com dois possíveis valores: `"yes"` e `"no"`.

Procedimento:

- Agrupamento por `Attrition` na camada Silver.
- Cálculo da quantidade (`qtd`) e do percentual (`perc`) em relação ao total de funcionários.

Resultados principais:

- Total de funcionários: **1.470**.
- Total de desligados (`Attrition = "yes"`): **237**.
- Taxa geral de attrition: **16,12%**.

Conclusão desta etapa:

- A base apresenta uma **taxa de desligamento moderada**, suficiente para análise comparativa entre grupos, sem forte desbalanceamento a ponto de inviabilizar a exploração.

---

## 5. Estatísticas descritivas das variáveis numéricas

Foi gerado um resumo estatístico para as variáveis numéricas mais relevantes, incluindo:

- `age`, `monthlyincome`, `distancefromhome`
- `yearsatcompany`, `yearsincurrentrole`, `yearssincelastpromotion`, `yearwithcurrmanager`
- entre outras variáveis contínuas incluídas em `numeric_cols`.

As estatísticas calculadas (via `describe()` e/ou agregações) consideram:

- mínimo, máximo
- média
- desvio padrão
- quartis (Q1, mediana, Q3) quando necessário.

Principais achados qualitativos:

- As idades concentram-se em torno da faixa de adultos, compatível com o mercado corporativo.
- A renda mensal (`monthlyincome`) apresenta dispersão significativa, porém coerente com a presença de múltiplos níveis hierárquicos.
- Variáveis de tempo (anos de empresa, anos no cargo etc.) apresentam distribuição variada, permitindo estudos de relacionamento com o turnover.

Conclusão desta etapa:

- Os valores mínimos e máximos observados **são compatíveis com a realidade de um ambiente corporativo**, não havendo evidências de erros grosseiros de escala (por exemplo, salários ou idades absurdamente fora do padrão esperado).

---

## 6. Detecção simples de outliers (Regra do IQR)

Para cada variável numérica em `numeric_cols`, foi aplicada a seguinte metodologia:

1. Cálculo do primeiro quartil (Q1) e terceiro quartil (Q3) via `approxQuantile`.
2. Cálculo do **IQR (Interquartile Range)** = `Q3 - Q1`.
3. Definição dos limites:
   - Limite inferior: `Q1 - 1,5 × IQR`
   - Limite superior: `Q3 + 1,5 × IQR`
4. Contagem de registros abaixo do limite inferior ou acima do limite superior.

Os resultados foram armazenados em um DataFrame com:

- `coluna`
- `q1`, `q3`, `iqr`
- `limite_inf`, `limite_sup`
- `qtd_outliers`

Principais achados:

- Algumas variáveis exibiram **pequena quantidade de possíveis outliers**, principalmente em:
  - variáveis de renda (`monthlyincome`);
  - algumas medidas de tempo (`yearsatcompany`, `yearsincurrentrole`);
  - eventualmente taxas relacionadas a remuneração.
- Os valores, embora extremos, **fazem sentido do ponto de vista de negócio**, representando colaboradores bem remunerados ou com longos períodos de casa.

Decisão:

- Dado o **baixo volume de outliers** e a **plausibilidade de negócio**, optou-se por **não removê-los** nesta versão do MVP.
- Essa escolha mantém a variabilidade real da base e evita perda de informação.

---

## 7. Cardinalidade das variáveis categóricas

Para cada coluna categórica (`string_cols`), foi calculado:

- `cardinalidade = número de valores distintos`.

Os resultados foram armazenados em um DataFrame com:

- `coluna`
- `cardinalidade`.

Principais achados:

- Colunas-chave como `department`, `jobrole`, `gender`, `maritalstatus` e `businesstravel` apresentam **cardinalidade baixa ou moderada**, adequada para:
  - criação de dimensões no modelo estrela;
  - utilização em agregações, segmentações e visualizações.
- Algumas colunas possuem cardinalidade igual a 1 (por exemplo, campos de configuração ou constantes), o que as torna pouco informativas para análise de variância e podem ser despriorizadas em análises avançadas.

Conclusão desta etapa:

- Não há colunas categóricas com cardinalidade excessiva que impeçam o uso em dashboards ou análises exploratórias.

---

## 8. Verificação das colunas derivadas

Na camada Silver foram criadas duas colunas derivadas:

- `faixa_salarial`: categorizando `monthlyincome` em faixas:
  - baixa
  - média
  - alta
- `faixa_etaria`: categorizando `age` em:
  - jovem
  - adulto
  - senior

Foram realizadas verificações para:

- Conferir se todas as linhas receberam uma categoria válida.
- Validar se a distribuição das faixas está coerente com a distribuição original de `age` e `monthlyincome`.

Principais achados:

- Todas as linhas foram classificadas corretamente em uma das faixas.
- A distribuição por faixa salarial e faixa etária está coerente com as estatísticas descritivas calculadas anteriormente.

---

## 9. Síntese da qualidade dos dados

A partir das análises realizadas, conclui-se que:

1. **Completude**
   - Não foram encontrados problemas relevantes de valores nulos ou vazios.
   - O dataset está adequado para uso direto em análises estatísticas e exploratórias.

2. **Duplicidade**
   - Não foram identificados registros duplicados.
   - Cada linha representa um colaborador distinto.

3. **Consistência**
   - Valores numéricos estão dentro de faixas plausíveis para o contexto de recursos humanos.
   - As colunas derivadas `faixa_salarial` e `faixa_etaria` foram validadas e se mostram consistentes.

4. **Outliers**
   - Existem valores extremos em algumas variáveis, porém em volume reduzido e coerentes com a realidade de negócio.
   - Optou-se por mantê-los no MVP, dado o foco em análise exploratória.

5. **Adequação ao objetivo**
   - A base possui qualidade suficiente para responder às principais perguntas de negócio relacionadas ao turnover:
     - diferenças por departamento, faixa salarial, faixa etária, gênero, tempo de empresa e nível/cargo;
     - identificação de variáveis numéricas mais correlacionadas ao desligamento.

---

## 10. Conclusão

A análise de qualidade dos dados indica que o dataset utilizado no MVP apresenta **boa integridade, completude e consistência**, sendo adequado para:

- construção do modelo dimensional em Esquema Estrela;
- análises exploratórias de turnover;
- cálculo de métricas, como taxa de attrition por segmento;
- estudos de correlação entre variáveis organizacionais e desligamento.

Eventuais melhorias futuras podem incluir:

- testes adicionais de robustez para outliers;
- normalização avançada de algumas variáveis;
- comparação com dados de períodos diferentes ou de outras unidades de negócio.
