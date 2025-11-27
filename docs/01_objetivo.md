# 🎯 Objetivo do Projeto  
## MVP – Pipeline de Dados em Nuvem para Análise de Turnover (Attrition)

---

## 1. Contexto

O desligamento de colaboradores, conhecido como *turnover* ou *attrition*, representa um dos principais desafios estratégicos da área de Recursos Humanos. Altas taxas de turnover podem indicar problemas de clima organizacional, insatisfação, desalinhamento de expectativas, falhas de liderança, políticas de remuneração inadequadas, ou até fatores externos ao ambiente corporativo. 

A compreensão profunda dos fatores que influenciam o desligamento é fundamental para que as organizações possam reduzir custos, melhorar a retenção de talentos, orientar políticas de RH e fortalecer o capital humano.

Neste MVP, será desenvolvido um **pipeline completo de dados em nuvem utilizando Databricks**, aplicando conceitos de ingestão, transformação, modelagem dimensional, qualidade de dados e análise exploratória, com foco na identificação dos principais fatores relacionados ao turnover dos colaboradores.

---

## 2. Objetivo Geral

Construir um **pipeline de dados moderno em nuvem**, baseado na plataforma Databricks, para analisar os fatores que influenciam o turnover, utilizando a base pública *IBM HR Analytics Employee Attrition & Performance*, e respondendo às perguntas de negócio previamente definidas.

---

## 3. Objetivos Específicos

1. Implementar a ingestão do dataset no Databricks (camada Bronze).
2. Realizar transformação e padronização de dados (camada Silver).
3. Construir um modelo analítico baseado em **Esquema Estrela**, compondo tabela fato e dimensões (camada Gold).
4. Elaborar um **Catálogo de Dados** contendo descrição detalhada dos atributos, tipos, domínios e linhagem.
5. Realizar uma **análise de qualidade dos dados**, identificando problemas como nulos, outliers, inconsistências e duplicidades.
6. Responder às perguntas de negócio relacionadas a turnover por meio de análises SQL, PySpark e visualizações.
7. Documentar completamente as etapas, decisões e resultados do processo.
8. Disponibilizar todo código-fonte, documentação e evidências no GitHub.

---

## 4. Perguntas de Negócio

As seguintes perguntas foram definidas *antes do início da coleta e ingestão dos dados*, conforme solicitado pela instituição.  
Mesmo que alguma pergunta não seja respondida plenamente, **elas devem permanecer documentadas**.

### 🔹 Turnover Geral
1. Qual é a taxa geral de turnover da empresa representada no dataset?

### 🔹 Demografia e Perfil do Colaborador
2. O turnover é maior em alguma faixa etária específica?
3. Existe diferença entre turnover de homens e mulheres?
4. Há variação significativa por estado civil?

### 🔹 Departamentos e Cargos
5. Quais departamentos apresentam as maiores taxas de desligamento?
6. Existem cargos ou níveis hierárquicos com maior propensão ao turnover?

### 🔹 Tempo de Empresa e Jornada
7. Funcionários com menos tempo de casa apresentam maior probabilidade de desligamento?
8. O número de anos no cargo está associado ao desligamento?

### 🔹 Remuneração e Benefícios
9. Há relação entre salário e turnover?  
10. O aumento salarial (*Salary Hike*) influencia a permanência?

### 🔹 Satisfação e Ambiente de Trabalho
11. Níveis de satisfação no trabalho influenciam o turnover?  
12. Funcionários com menor engajamento ou satisfação tendem a sair mais?

### 🔹 Viagens e Rotina
13. A frequência de viagens a trabalho impacta o desligamento?  

### 🔹 Outras relações relevantes
14. Quais variáveis melhor explicam o turnover segundo análise estatística?  
15. É possível prever a probabilidade de desligamento com base no histórico disponível? (*Análise opcional.*)

---

## 5. Escopo do Trabalho

O projeto se limitará às informações contidas no dataset público utilizado.  
Não serão utilizados dados sensíveis, proprietários ou restritos.  
A implementação será realizada exclusivamente na **Databricks Community Edition**, respeitando suas limitações computacionais.

---

## 6. Entregáveis

- Pipelines de ingestão, transformação e modelagem em notebooks Databricks  
- Arquitetura de camadas: Bronze → Silver → Gold  
- Modelo dimensional (DW) documentado  
- Catálogo de Dados  
- Análise de qualidade por atributo  
- Análises e visualizações respondendo às perguntas de negócio  
- Relatório de autoavaliação  
- Repositório GitHub contendo código, evidências e documentação

---

## 7. Conclusão

Este documento define claramente o **objetivo**, o **escopo** e as **perguntas de negócio** que direcionam todo o desenvolvimento do MVP.  
A partir deste ponto, inicia-se a etapa de busca, coleta e ingestão dos dados, conforme estabelecido pela instituição.

---
