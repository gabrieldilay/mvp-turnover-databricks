# 8. Autoavaliação

Esta autoavaliação apresenta uma reflexão crítica sobre o desenvolvimento do MVP, considerando o atendimento aos objetivos definidos, as dificuldades enfrentadas, os aprendizados adquiridos e as oportunidades de evolução futura.

---

## 1. Atingimento dos Objetivos

De forma geral, considero que o MVP atingiu plenamente os objetivos propostos pela disciplina.  
Entre os principais pontos alcançados, destacam-se:

- Construção de um pipeline completo em camadas (Bronze → Silver → Gold) utilizando PySpark e Delta Lake.
- Organização do projeto segundo princípios de arquitetura Lakehouse.
- Documentação estruturada e alinhada ao padrão exigido pela PUC Rio Digital.
- Análise aprofundada do fenômeno de turnover, com respostas claras e objetivas às perguntas de negócio definidas previamente.
- Desenvolvimento de visualizações e métricas consistentes, que permitem interpretações fundamentadas e orientadas ao negócio.

O projeto também demonstrou a capacidade de integrar conceitos de **engenharia de dados**, **qualidade de dados** e **análise exploratória** em um fluxo coerente, robusto e replicável.

---

## 2. Dificuldades Enfrentadas

Durante o desenvolvimento do MVP, algumas dificuldades merecem destaque:

### • Ajustes em PySpark e Delta Lake  
Foi necessário revisar e refinar diversas funções de transformação até alcançar a padronização final das camadas Silver e Gold.  
Funções como `withColumn`, `when`, `agg` e tratativas de tipos de dados exigiram atenção especial para evitar inconsistências e erros de execução.

### • Organização da Modelagem Dimensional  
Embora o dataset utilizado seja relativamente simples, estruturar um modelo estrela que fosse ao mesmo tempo didático e aderente às boas práticas de Data Warehouse demandou reflexão sobre granularidade, chaves substitutas e separação adequada das dimensões.

### • Produção da Documentação em Padrão Acadêmico  
A elaboração da documentação completa (objetivo, origem dos dados, catálogo, modelagem, análises, conclusão e autoavaliação) exigiu tempo adicional para garantir clareza, consistência conceitual e aderência às diretrizes acadêmicas da instituição.

### • Execução Fora do Databricks  
Como o MVP foi desenvolvido em ambiente Jupyter Notebook e não diretamente na plataforma Databricks, foi necessário adaptar as instruções de execução para garantir que o projeto pudesse ser reproduzido tanto localmente quanto, de forma opcional, no Databricks Community Edition.

---

## 3. Aprendizados Adquiridos

O desenvolvimento deste MVP proporcionou aprendizados relevantes, entre eles:

- Maior domínio prático do ecossistema Spark e do conceito de Lakehouse.
- Evolução na capacidade de projetar pipelines de dados estruturados, escaláveis e bem documentados.
- Aplicação de conceitos de qualidade de dados em um cenário real.
- Melhoria na escrita técnica e na organização de documentação para projetos de dados.
- Compreensão mais profunda da importância da camada Silver como etapa crítica de refinamento e preparação analítica.

Além disso, a análise do turnover fortaleceu a habilidade de interpretar indicadores organizacionais e conectá-los a decisões estratégicas de negócio.

---

## 4. Pontos a Melhorar

Mesmo com a entrega completa do MVP, alguns aspectos podem ser aprimorados em versões futuras:

- Implementação de mecanismos de orquestração automatizada, como Airflow ou Databricks Jobs.
- Expansão das análises para incluir novas hipóteses, como absenteísmo (não disponível no dataset utilizado).
- Inclusão de testes automatizados de qualidade de dados utilizando ferramentas como Great Expectations ou Deequ.
- Uso mais avançado de recursos do Delta Lake, como versionamento e time travel, de forma formalizada na arquitetura.

---

## 5. Trabalhos Futuros

Como continuidade natural do projeto, destacam-se as seguintes possibilidades:

### • Modelo Preditivo de Turnover  
Desenvolver um classificador capaz de prever a probabilidade de desligamento dos colaboradores com base em variáveis comportamentais, organizacionais e históricas.

### • Dashboard Executivo  
Criar visualizações interativas para stakeholders, utilizando ferramentas como Power BI ou Databricks SQL Dashboards.

### • Pipeline Orquestrado  
Transformar o MVP em um fluxo contínuo de dados, com monitoramento, logs e alertas automatizados.

### • Inclusão de Novas Fontes de Dados  
Incorporar dados adicionais, como:
- avaliações de performance,
- indicadores de absenteísmo,
- pesquisas de clima organizacional,
- histórico de promoções e trilhas de carreira.

---

## 6. Conclusão da Autoavaliação

O desenvolvimento deste MVP representou uma experiência completa, combinando engenharia de dados, análise exploratória e reflexão crítica.  
O projeto contribuiu significativamente para o fortalecimento das competências técnicas e conceituais abordadas na disciplina.

Considero que o trabalho representa de forma fiel a proposta do curso e atende integralmente aos critérios estabelecidos para avaliação, refletindo maturidade técnica, organização metodológica e capacidade analítica aplicada a um problema real de negócio.
