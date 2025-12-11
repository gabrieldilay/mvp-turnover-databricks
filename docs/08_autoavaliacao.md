# 08. Autoavaliação

Este documento apresenta a autoavaliação referente ao desenvolvimento do MVP, conforme solicitado pela instituição. Aqui são descritas as reflexões sobre o processo, o atingimento dos objetivos, as dificuldades enfrentadas e as oportunidades de evolução para trabalhos futuros.

---

## 1. Atingimento dos Objetivos Propostos

Os objetivos definidos no início do projeto foram atingidos de maneira satisfatória.  
Foi possível:

- Construir um pipeline completo de dados com as camadas Bronze, Silver e Gold.
- Padronizar, limpar e enriquecer os dados utilizando PySpark.
- Criar um modelo dimensional em formato estrela e documentá-lo adequadamente.
- Desenvolver um catálogo de dados completo.
- Realizar análises exploratórias que respondem às principais perguntas de negócio.
- Documentar todo o processo conforme solicitado, incluindo evidências e organização em pastas.
- Disponibilizar o repositório final no GitHub, com clareza e rastreabilidade.

Embora algumas perguntas de negócio tenham sido respondidas parcialmente, isso ocorreu devido à ausência de variáveis específicas no dataset público utilizado. A documentação foi mantida integral conforme exigido.

Em síntese, considero que o escopo definido foi plenamente atendido.

---

## 2. Dificuldades Encontradas

Durante o desenvolvimento deste MVP, algumas dificuldades merecem destaque:

### 2.1 Limitações da Databricks Community Edition
A plataforma possui limitações de:

- memória,
- tempo de execução,
- tamanho de cluster,
- reinicializações inesperadas.

Isso exigiu adaptações, modularização e controle cuidadoso dos DataFrames.

### 2.2 Ajustes e Tratamento da Base IBM HR
Apesar de ser uma base pública e relativamente limpa, foi necessário:

- padronizar textos,
- lidar com categorias inconsistentes,
- criar colunas derivadas coerentes para análises,
- realizar validações de qualidade.

### 2.3 Organização das Etapas do Pipeline
A separação adequada entre Bronze, Silver e Gold exigiu planejamento para que:

- nenhuma transformação ocorresse na Bronze,
- Silver mantivesse apenas dados limpos,
- Gold fosse exclusivamente analítica.

Esse processo trouxe aprendizado significativo sobre arquitetura de dados.

### 2.4 Modelagem Dimensional
A conversão de atributos em dimensões e a definição das chaves exigiram:
- análise de cardinalidade,
- tratamento de categóricos,
- visão clara das perguntas de negócio.

---

## 3. Aprendizados Obtidos

O projeto proporcionou aprendizados essenciais:

- domínio prático do ecossistema Spark/Delta Lake;
- maior entendimento sobre pipelines de dados e suas camadas;
- aplicação de conceitos de Data Lakehouse;
- prática real de análise exploratória orientada a negócio;
- construção de documentação técnica profissional;
- consolidação de boas práticas de Engenharia de Dados.

Além disso, a compreensão da relação entre dados e comportamento organizacional ficou mais evidente, especialmente no contexto de RH Analytics.

---

## 4. Oportunidades de Melhoria e Trabalhos Futuros

Algumas melhorias podem ser exploradas em versões futuras do projeto:

1. Criação de modelos preditivos de churn com MLflow no Databricks.
2. Implementação de testes automáticos de qualidade de dados (Great Expectations ou Deequ).
3. Construção de dashboards executivos em Power BI conectados à camada Gold.
4. Automação completa do pipeline com Databricks Workflows.
5. Incremento do pipeline com múltiplas fontes de dados (ex.: absenteísmo, pesquisas de clima).
6. Ampliação do modelo dimensional com novas dimensões e granularidades.

Essas evoluções fortaleceriam o projeto e permitiriam análises ainda mais robustas.

---

## 5. Conclusão da Autoavaliação

A execução deste MVP representou um processo completo de engenharia de dados, desde a ingestão até a análise final, incluindo modelagem, documentação e organização segundo padrões corporativos.  
As dificuldades enfrentadas foram superadas com aprendizado prático, e os resultados obtidos respondem de forma consistente às perguntas de negócio propostas.
