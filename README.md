# MVP – Pipeline de Dados para Análise de Turnover
### Pós-graduação em Data Science & Machine Learning – PUC Rio Digital

---

## 1. Objetivo do Trabalho

O objetivo deste MVP é construir um pipeline de dados em camadas (Bronze, Silver e Gold), utilizando tecnologias de processamento distribuído, para analisar o fenômeno de turnover (attrition) em uma base de Recursos Humanos.

O projeto tem como finalidade identificar padrões de desligamento de funcionários, responder perguntas de negócio relevantes e fornecer recomendações com base em dados. Todas as perguntas foram definidas antes do início da análise, conforme as diretrizes da instituição.

---

## 2. Perguntas de Negócio

1. Qual é o turnover total da empresa no período analisado?
2. Quais departamentos possuem maior índice de desligamentos?
3. Existem diferenças de turnover por faixa etária, nível hierárquico ou gênero?
4. Funcionários com mais anos de empresa têm maior ou menor probabilidade de desligamento?
5. Quais variáveis numéricas apresentam maior correlação com o desligamento?
6. Há padrões de absenteísmo relacionados ao turnover? (não disponível nesta base)
7. O salário possui relação direta ou inversa com o desligamento?
8. O turnover está concentrado em determinados cargos (job roles)?
9. O turnover varia com o nível de senioridade (job level)?
10. Os primeiros anos de empresa apresentam maior risco de desligamento?
11. Quais ações podem ser sugeridas para reduzir o turnover?

---

## 3. Base de Dados Utilizada

A base selecionada foi **IBM HR Analytics Employee Attrition**, amplamente utilizada em estudos de RH e disponibilizada publicamente em:

Kaggle: https://www.kaggle.com/datasets

A base não possui restrições para uso educacional.

---

## 4. Coleta dos Dados

A coleta foi realizada manualmente através do download do arquivo CSV.  
O arquivo foi carregado no ambiente de execução e armazenado na camada Bronze, onde foi convertido para o formato Delta Lake para viabilizar o processamento nas próximas etapas.

---

## 5. Modelagem dos Dados

O projeto utiliza um modelo de camadas inspirado em Data Lakehouse:

### Camada Bronze
- Armazena os dados brutos.
- Nenhuma transformação aplicada.
- Conversão do CSV original para Delta Lake.

### Camada Silver
- Padronização de colunas categóricas (trim, lower).
- Criação das colunas derivadas:
  - `faixa_etaria`
  - `faixa_salarial`
- Análise completa de qualidade dos dados:
  - valores nulos
  - duplicados
  - cardinalidade
  - distribuição do target
  - outliers (regra do IQR)
- Preparação final da base para análises.

### Camada Gold
- Cálculo das métricas centrais de negócio:
  - turnover geral
  - turnover por departamento
  - turnover por faixa etária
  - turnover por faixa salarial
  - turnover por gênero
  - turnover por job level
  - turnover por tempo de empresa
  - turnover por função (job role)
- Correlação entre variáveis numéricas e desligamento.
- Consolidação final dos KPIs.
- Geração de visualizações e tabelas analíticas.

---

## 6. Catálogo de Dados

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| age | int | Idade do funcionário |
| monthlyincome | double | Renda mensal |
| department | string | Departamento |
| jobrole | string | Cargo exercido |
| joblevel | int | Nível hierárquico |
| attrition | string | Indica desligamento (yes/no) |
| yearsatcompany | int | Tempo de empresa |
| faixa_etaria | string | Categoria derivada |
| faixa_salarial | string | Categoria derivada |

Regras criadas:

**Faixa Salarial**  
- < 3000: baixa  
- 3000–6999: média  
- ≥ 7000: alta  

**Faixa Etária**  
- < 30: jovem  
- 30–49: adulto  
- ≥ 50: senior  

---

## 7. Pipeline de ETL

Etapas implementadas:

1. Carregamento do CSV na camada Bronze.
2. Conversão para tabela Delta.
3. Inicialização da sessão Spark.
4. Padronização e limpeza dos dados.
5. Criação das colunas derivadas.
6. Análise de qualidade.
7. Escrita dos dados Silver.
8. Cálculo de métricas analíticas.
9. Escrita das tabelas Gold.
10. Consolidação dos KPIs.
11. Geração de visualizações.
12. Análise de correlação.
13. Conclusão final do estudo.

---

## 8. Qualidade dos Dados

Foram verificadas:

- Valores nulos: não significativos.
- Duplicados: inexistentes.
- Outliers: principalmente em renda e tempo, condizentes com o contexto.
- Cardinalidade adequada nas colunas categóricas.
- Target balanceado: attrition geral de aproximadamente 16%.

A base foi considerada apropriada para análise.

---

## 9. Principais Resultados (Camada Gold)

### Turnover Geral
**16.12%**

### Turnover por Departamento

| Departamento | Attrition (%) |
|--------------|---------------|
| Sales | 20.63 |
| Human Resources | 19.05 |
| Research & Development | 13.84 |

### Turnover por Faixa Salarial

| Faixa | Attrition (%) |
|-------|---------------|
| baixa | 28.61 |
| média | 12.03 |
| alta | 10.8 |

### Turnover por Faixa Etária

| Faixa | Attrition (%) |
|-------|---------------|
| jovem | 27.91 |
| adulto | 12.67 |
| senior | 13.29 |

### Turnover por Nível de Cargo

Job Level 1: **26.34%**  
Níveis superiores: abaixo de 10%

### Turnover por Tempo de Empresa

O primeiro ano registra o maior risco: **36.5%**

### Turnover por Função

Funções com maior risco:

- Laboratory Technician  
- Human Resources  
- Sales Representative  

### Correlação com Variáveis Numéricas

Correlação baixa (< 0.1) para todas as variáveis numéricas.  
As mais relevantes foram:

- distancefromhome
- numcompaniesworked
- monthlyrate

---

## 10. Discussão dos Resultados

Os resultados demonstram que:

- Turnover é maior entre funcionários jovens, de baixa renda e cargos de nível inicial.
- Os dois primeiros anos de empresa concentram a maior probabilidade de desligamento.
- Departamentos como Sales e Human Resources apresentam maior risco.
- Funções operacionais exibem maior rotatividade.
- Variáveis numéricas não explicam diretamente o fenômeno.

O turnover é predominantemente influenciado por fatores comportamentais e organizacionais.

---

## 11. Conclusão Final

O pipeline desenvolvido permitiu estruturar os dados em camadas e gerar análises robustas que respondem às principais perguntas de negócio.

A arquitetura Bronze → Silver → Gold se mostrou adequada para transformar dados brutos em métricas analíticas confiáveis.

Os resultados identificaram perfis de maior risco e etapas críticas da jornada do colaborador, permitindo recomendações de ações organizacionais tais como:

- Revisão salarial e políticas de valorização.
- Programas de retenção para jovens talentos.
- Fortalecimento do onboarding nos primeiros anos.
- Diagnósticos específicos em departamentos críticos.

O MVP cumpre integralmente sua função de demonstrar domínio técnico e capacidade analítica aplicada ao contexto de Recursos Humanos.

---

## 12. Autoavaliação

### Pontos atendidos
- Objetivo bem definido e mantido conforme exigido.
- Pipeline completo implementado.
- Documentação estruturada.
- Análises conduzidas com clareza e justificadas.
- Conclusões conectadas às perguntas de negócio.

### Dificuldades encontradas
- Ajustes necessários em funções Spark.
- Iterações sucessivas para depuração e padronização.
- Necessidade de refinar a qualidade dos dados antes da análise.

### Trabalhos futuros
- Desenvolvimento de modelo preditivo de churn.
- Dashboard interativo para stakeholders.
- Orquestração por ferramentas como Airflow.
- Inclusão de novas variáveis como absenteísmo.

