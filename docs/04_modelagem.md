# 04 - Modelagem e Arquitetura do Pipeline de Dados

Este documento apresenta a modelagem do pipeline de dados desenvolvido no MVP, incluindo a arquitetura das camadas, o modelo lógico baseado em Esquema Estrela, a descrição das tabelas Fato e Dimensão e a linhagem dos dados desde a ingestão até a camada analítica final.

---

# 1. Arquitetura Geral do Pipeline

O pipeline foi construído seguindo a abordagem de arquitetura Lakehouse utilizando Databricks e armazenamento em Delta Lake.

O fluxo de transformação é estruturado em três camadas:
Bronze → Silver → Gold


## 1.1. Camada Bronze  
A camada Bronze contém os dados exatamente como foram ingeridos da fonte original, sem qualquer transformação.

Características principais:

- Dados em formato bruto (raw).  
- Preservação integral do dataset original.  
- Carregamento direto do CSV para formato Delta Lake.  
- Serve como base de auditoria e versionamento.

Arquivo carregado:
- `WA_Fn-UseC_-HR-Employee-Attrition.csv`

Tabela gerada:
- `/home/jovyan/data/bronze/delta_ibm_hr`

---

## 1.2. Camada Silver  
A camada Silver aplica padronização, limpeza e derivação de atributos.

Principais transformações:

- Normalização de colunas string (trim + lower).  
- Conversão de tipos.  
- Criação das classificações derivadas:
  - `faixa_salarial`  
  - `faixa_etaria`  
- Análise de qualidade: nulos, duplicidades, outliers, cardinalidade.  
- Estrutura pronta para análises e modelagem dimensional.

Tabela gerada:
- `/home/jovyan/data/silver/delta_ibm_hr_silver`

---

## 1.3. Camada Gold  
A camada Gold contém os dados analíticos finais prontos para consumo.

Elementos principais:

- Agregações e métricas de attrition por:
  - departamento  
  - faixa salarial  
  - faixa etária  
  - gênero  
  - cargo  
  - nível hierárquico  
  - tempo de empresa  
- Consolidação em um DataFrame único para visualizações.  
- Base para dashboards, storytelling analítico e insights.

Tabelas geradas:

- `attrition_por_departamento`
- `attrition_por_faixa_salarial`
- `attrition_por_faixa_etaria`
- `attrition_por_genero`
- `attrition_por_tempo_empresa`
- `attrition_por_cargo`
- `consolidado_attrition`

---

# 2. Modelo de Dados – Esquema Estrela

A modelagem dimensional foi estruturada em formato Estrela, separando a tabela fato das dimensões que compõem o perfil do colaborador.

Abaixo está o diagrama textual:

                       dim_departamento
                             |
                             | dept_id
                             |
    dim_cargo      cargo_id  |
                             |
                             | fato_attrition        salary_range_id      dim_faixa_salarial
    dim_genero    gender_id  |
                             |
                             | years_company_id      dim_tempo_empresa
                             |
                             | age_range_id          dim_faixa_etaria

---

# 3. Tabelas do Modelo Dimensional

## 3.1. Tabela Fato – fato_attrition

Contém os eventos de desligamento e variáveis quantitativas relevantes.

| Campo             | Tipo   | Descrição |
|------------------|--------|-----------|
| employee_id      | int    | Identificador único |
| dept_id          | int    | Chave para departamento |
| cargo_id         | int    | Chave para cargo |
| gender_id        | int    | Chave para gênero |
| salary_range_id  | int    | Chave para faixa salarial |
| age_range_id     | int    | Chave para faixa etária |
| years_company_id | int    | Chave para tempo de empresa |
| attrition_flag   | int    | 1 = desligado, 0 = permaneceu |
| monthlyincome    | double | Renda mensal |
| distancefromhome | int    | Distância até o trabalho |
| yearsatcompany   | int    | Tempo de empresa |
| joblevel         | int    | Nível do cargo |

---

# 3.2. Tabelas Dimensão

## dim_departamento

| Campo      | Tipo | Descrição |
|------------|------|-----------|
| dept_id    | int  | Chave primária |
| department | text | Nome do departamento |

---

## dim_cargo

| Campo    | Tipo | Descrição |
|----------|------|-----------|
| cargo_id | int  | Chave primária |
| jobrole  | text | Nome do cargo |

---

## dim_genero

| Campo     | Tipo | Descrição |
|-----------|------|-----------|
| gender_id | int  | Chave primária |
| gender    | text | Masculino / Feminino |

---

## dim_faixa_salarial

| Campo            | Tipo | Descrição |
|------------------|------|-----------|
| salary_range_id  | int  | Chave primária |
| faixa_salarial   | text | baixa / média / alta |

---

## dim_faixa_etaria

| Campo         | Tipo | Descrição |
|---------------|------|-----------|
| age_range_id  | int  | Chave primária |
| faixa_etaria  | text | jovem / adulto / senior |

---

## dim_tempo_empresa

| Campo             | Tipo | Descrição |
|-------------------|------|-----------|
| years_company_id  | int  | Chave primária |
| yearsatcompany    | int  | Anos de empresa |

---

# 4. Linhagem dos Dados

A linhagem detalha o caminho percorrido pelas informações desde a origem até a camada analítica.

### Origem  
Dataset público da IBM (HR Analytics Employee Attrition & Performance).  
Formato CSV.

### Bronze  
Ingestão bruta sem transformações.

### Silver  
Transformações aplicadas:

- Padronização  
- Tratamento de nulos  
- Criação de atributos derivados  
- Garantia de qualidade e consistência  

### Gold  
Processos aplicados:

- Agregações analíticas  
- Geração de métricas  
- Consolidação em tabela única  
- Base para visualizações e conclusões

---

# 5. Considerações Finais

A modelagem apresentada garante:

- Clareza e escalabilidade  
- Dados organizados seguindo padrões de arquitetura moderna  
- Facilidade de consulta e análise  
- Extensibilidade para machine learning e predições futuras  
