# 06. Análises da Camada Gold

Este documento apresenta as análises realizadas a partir das tabelas consolidadas na **Camada Gold**, incluindo cálculos de métricas de turnover segmentadas e visualizações que respondem às perguntas de negócio definidas no início do projeto.

A Camada Gold contém:

- métricas gerais de attrition;
- métricas segmentadas por departamento, faixa salarial e faixa etária;
- análises adicionais por gênero, cargo, nível hierárquico e tempo de empresa;
- matriz de correlação entre variáveis numéricas.

---

# 1. Taxa Geral de Attrition

A taxa geral de desligamento foi calculada com base nos valores da camada Silver:

- **Total de funcionários:** 1.470  
- **Total de desligados:** 237  
- **Taxa geral de attrition:** **16,12%**

Essa taxa serve como referência para todas as análises segmentadas subsequentes.

---

# 2. Attrition por Departamento

A métrica foi calculada agrupando pela coluna `department`.

| Departamento             | Total | Saiu | Taxa Attrition |
|--------------------------|-------|------|----------------|
| Sales                    | 446   | 92   | **20,63%**     |
| Human Resources          | 63    | 12   | 19,05%         |
| Research & Development   | 961   | 133  | **13,84%**     |

**Conclusões:**

- O departamento **Sales** é o mais crítico, com attrition acima da média geral.
- O departamento **Human Resources** também apresenta taxa elevada, embora com volume menor.
- **R&D** tem a taxa mais baixa e apresenta maior estabilidade.

---

# 3. Attrition por Faixa Salarial

Faixas categorizadas na Silver:

- baixa < 3000  
- média entre 3000 e 6999  
- alta ≥ 7000  

| Faixa Salarial | Total | Saiu | Taxa Attrition |
|----------------|-------|------|----------------|
| baixa          | 395   | 113  | **28,61%**     |
| média          | 640   | 77   | 12,03%         |
| alta           | 435   | 47   | **10,8%**      |

**Conclusões:**

- Funcionários de **baixa renda apresentam quase 3x mais risco de sair**.
- A relação inversa entre remuneração e desligamento é clara.
- Pode indicar insatisfação salarial, oportunidades externas mais atrativas ou baixa retenção em funções operacionais.

---

# 4. Attrition por Faixa Etária

Faixas de idade definidas na Silver:

- jovem (<30)
- adulto (30–49)
- senior (50+)

| Faixa Etária | Total | Saiu | Taxa Attrition |
|--------------|-------|------|----------------|
| jovem        | 326   | 91   | **27,91%**     |
| adulto       | 971   | 123  | 12,67%         |
| senior       | 173   | 23   | 13,29%         |

**Conclusões:**

- Jovens têm **mais que o dobro da taxa** de desligamento dos demais grupos.
- Pode indicar:
  - busca por crescimento rápido,
  - baixa satisfação inicial,
  - desalinhamento de expectativas,
  - rotatividade natural do início de carreira.

---

# 5. Attrition Consolidado

A Camada Gold unifica todas as métricas em uma única tabela:

| Métrica                | Valor (%) |
|------------------------|-----------|
| taxa_geral_attrition   | 16,12     |
| dep_sales              | 20,63     |
| dep_human_resources    | 19,05     |
| dep_research           | 13,84     |
| sal_baixa              | 28,61     |
| sal_media              | 12,03     |
| sal_alta               | 10,80     |
| idade_jovem            | 27,91     |
| idade_adulto           | 12,67     |
| idade_senior           | 13,29     |

Essa tabela foi usada como base para visualizações e comparações.

---

# 6. Visualizações da Camada Gold

Foram gerados gráficos com Matplotlib, representando:

### 6.1 Attrition por Departamento
- O gráfico de barras evidencia a posição crítica de **Sales**.
- Human Resources também se destaca negativamente.

### 6.2 Attrition por Faixa Salarial
- Faixa **baixa** domina o cenário de risco.
- Faixa **alta** permanece bem abaixo da média geral.

### 6.3 Attrition por Faixa Etária
- Jovens lideram amplamente o desligamento.
- Adultos e seniors mantêm padrões similares.

As visualizações servem como evidência visual para tomada de decisão estratégica.

---

# 7. Análises Adicionais na Camada Gold

Além das três dimensões principais solicitadas pela instituição, foram incluídas análises complementares:

---

## 7.1 Attrition por Gênero

| Gênero | Total | Saiu | Taxa Attrition |
|--------|-------|------|----------------|
| male   | 588   | 87   | 14,80%         |
| female | 882   | 150  | **17,01%**     |

**Conclusão:** mulheres apresentam taxa ligeiramente maior, porém diferença pequena.

---

## 7.2 Attrition por Cargo (Job Role)

Exemplos dos resultados:

| Cargo                    | Taxa Attrition |
|--------------------------|----------------|
| Sales Representative      | 39,76%         |
| Laboratory Technician     | 23,94%         |
| Manufacturing Director    | 16,67%         |
| Research Scientist        | 13,88%         |
| Manager                   | 2,5%           |

**Conclusões:**

- Alguns cargos apresentam **risco extremamente elevado**, como *Sales Representative*.
- Cargos de liderança têm risco muito baixo.

---

## 7.3 Attrition por Nível Hierárquico (JobLevel)

| Nivel | Taxa Attrition |
|-------|----------------|
| 1     | **26,34%**     |
| 2     | 9,74%          |
| 3     | 14,68%         |
| 4     | 4,72%          |
| 5     | 7,25%          |

**Conclusões:**

- O maior risco está no **Nível 1**, geralmente operacionais ou iniciantes.
- Níveis mais altos demonstram maior estabilidade.

---

## 7.4 Attrition por Tempo de Empresa (Years at Company)

Resultado parcial:

| Anos Empresa | Taxa Attrition |
|--------------|----------------|
| 1            | 36,36%         |
| 2            | 14,66%         |
| 3            | 17,03%         |
| 4            | 19,72%         |
| ...          | ...            |

**Conclusões:**

- A **maior taxa ocorre no primeiro ano**.
- Após o segundo ano, o turnover se estabiliza.
- Ciclos de adaptação são evidentes.

---

# 8. Correlação entre Variáveis Numéricas

Uma coluna binária foi criada (`attrition_flag`), sendo:

- 1 = desligado  
- 0 = permaneceu  

Após isso, calculou-se uma matriz de correlação usando `toPandas().corr()`.

Ranking das variáveis com maior correlação com attrition:

| Variável              | Correlação |
|------------------------|-----------|
| distancefromhome       | **0.0879** |
| numcompaniesworked     | 0.0434     |
| monthlyrate            | 0.0215     |
| performanceRating      | 0.0028     |
| hourlyrate             | 0.0016     |
| ...                    | ...        |

Principais pontos:

- O dataset apresenta **correlações fracas**, típico de bases de RH sem relações estritamente lineares.
- Mesmo correlações fracas podem ser informativas quando analisadas junto com variáveis categóricas.

---

# 9. Conclusões Gerais da Camada Gold

As análises permitiram identificar padrões relevantes:

### 1. **Remuneração e idade são os fatores mais relevantes**
- Faixa salarial baixa → 28,61%  
- Jovens → 27,91%

### 2. **Departamentos possuem comportamento heterogêneo**
- Sales lidera em desligamentos.

### 3. **Primeiro ano de empresa é crítico**
- Turnover de 36% no Year 1.

### 4. **Rotatividade não é aleatória**
- Embora correlações numéricas sejam baixas, variáveis categóricas mostram padrões fortes.

### 5. **Gold Layer está consolidada**
- Três tabelas principais (departamento, salário, idade)
- Tabelas complementares (gênero, cargo, nível, tempo empresa)
- Visuais claros para comunicação gerencial.

---

# 10. Encerramento

A camada Gold cumpre o papel de:

- Consolidar métricas relevantes de turnover;
- Organizar informações para visualizações e relatórios;
- Permitir interpretação clara de padrões;
- Sustentar recomendações estratégicas para RH.
