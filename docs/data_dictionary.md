# Catálogo de Dados – IBM HR Analytics Employee Attrition

Este catálogo descreve detalhadamente cada coluna da base utilizada no MVP, incluindo tipo, descrição, domínio esperado e limites estatísticos observados durante a análise.

---

## 1. Variáveis Originais da Base

| Coluna | Tipo | Descrição | Domínio / Intervalo Esperado | Observações |
|--------|------|-----------|-------------------------------|-------------|
| age | int | Idade do funcionário | 18 a 60 | Valores confirmados na análise de outliers |
| attrition | string | Indica se o funcionário saiu da empresa | {yes, no} | Target do modelo |
| businesstravel | string | Frequência de viagens corporativas | {non-travel, travel\_rarely, travel\_frequently} | Padronizado na Silver |
| dailyrate | int | Taxa diária de remuneração | 100 a 1500 | Base não apresenta valores extremos |
| department | string | Departamento de atuação | {sales, research & development, human resources} | Textos padronizados para minúsculas |
| distancefromhome | int | Distância da casa ao trabalho | 1 a 29 | Ligação moderada com turnover |
| education | int | Nível educacional | 1 a 5 | 1: abaixo graduação, 5: superior |
| educationfield | string | Área de formação | {life sciences, medical, marketing, technical degree, human resources, other} | Padronizado na Silver |
| employeecount | int | Contagem padrão | 1 | Valor constante em toda a base |
| employeenumber | int | Identificador interno | 1 a 2068 | Não utilizado na análise |
| environmentsatisfaction | int | Satisfação com ambiente | 1 (baixa) a 4 (alta) | Escala ordinal |
| gender | string | Gênero | {male, female} | Textos padronizados |
| hourlyrate | int | Valor da hora | 30 a 100 | Distribuição uniforme |
| jobinvolvement | int | Envolvimento no trabalho | 1 a 4 | Escala ordinal |
| joblevel | int | Nível do cargo | 1 a 5 | 1 é o nível de entrada |
| jobrole | string | Função desempenhada | {sales executive, research scientist, laboratory technician, manufacturing director, healthcare representative, manager, human resources, research director, sales representative} | Padronizado |
| jobsatisfaction | int | Satisfação com o trabalho | 1 a 4 | Escala ordinal |
| maritalstatus | string | Estado civil | {single, married, divorced} | Padronizado |
| monthlyincome | double | Renda mensal | 1000 a 20000 | Utilizado para criar faixa salarial |
| monthlyrate | int | Taxa mensal | 2000 a 30000 | Sem anomalias detectadas |
| numcompaniesworked | int | Nº de empresas anteriores | 0 a 9 | Correlação moderada com turnover |
| over18 | string | Indica se é maior de idade | {yes} | Valor constante |
| overtim e | string | Realiza horas extras | {yes, no} | Forte impacto em turnover (comum em literatura) |
| percentsalaryhike | int | % de aumento salarial | 11 a 25 | Anual |
| performancerating | int | Avaliação de desempenho | 3 ou 4 | Pouca variabilidade |
| relationshipsatisfaction | int | Satisfação com colegas | 1 a 4 | Escala ordinal |
| standardhours | int | Horas padrão | 80 | Valor constante |
| stockoptionlevel | int | Nível de ações/participação | 0 a 3 | Baixa cardinalidade |
| totalworkingyears | int | Total de anos de carreira | 0 a 40 | Analisado na Silver |
| trainingtimeslastyear | int | Treinamentos no último ano | 0 a 6 | Não influenciou muito a correlação |
| worklifebalance | int | Equilíbrio vida-trabalho | 1 a 4 | Escala ordinal |
| yearsatcompany | int | Tempo de empresa | 0 a 40 | Usado na análise por ano |
| yearsincurrentrole | int | Tempo no cargo atual | 0 a 18 | Escala consistente |
| yearssincelastpromotion | int | Tempo desde última promoção | 0 a 15 | Base não apresenta outliers |
| yearswithcurrmanager | int | Tempo com gestor atual | 0 a 17 | Consistente |

---

## 2. Variáveis Criadas na Camada Silver

| Coluna | Tipo | Descrição | Regra de Formação |
|--------|------|-----------|------------------|
| faixa_salarial | string | Agrupamento da renda mensal | baixa (< 3000), média (3000–6999), alta (≥ 7000) |
| faixa_etaria | string | Agrupamento da idade | jovem (< 30), adulto (30–49), senior (≥ 50) |
| attrition_flag | int | Indicação numérica do desligamento | yes → 1, no → 0 |

---

## 3. Linhagem dos Dados (Data Lineage)

### 1. Origem
- Arquivo CSV obtido no Kaggle.

### 2. Camada Bronze
- Dados carregados sem modificação.
- Conversão para Delta Lake.

### 3. Camada Silver
Transformações aplicadas:
- Padronização de strings (trim + lower).
- Conversão de tipos.
- Criação de colunas derivadas.
- Análise de qualidade:
  - nulos  
  - duplicados  
  - cardinalidade  
  - estatísticas  
  - outliers  

### 4. Camada Gold
- Agregações analíticas.
- Cálculo de métricas e KPIs.
- Consolidação das análises.
- Salvamento de tabelas finais em Delta Lake.

---

## 4. Observações Gerais

- A base é bem estruturada e possui poucos problemas de qualidade.
- Variáveis constantes foram mantidas por consistência, mas não utilizadas na análise.
- Todas as variáveis categóricas foram padronizadas para minúsculas.
- Não foram identificados outliers que prejudicassem a análise.
- A variável `attrition` é balanceada o suficiente para métricas descritivas.

---

