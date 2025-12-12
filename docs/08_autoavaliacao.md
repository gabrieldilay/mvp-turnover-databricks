# 8. Autoavaliação

Esta autoavaliação apresenta uma reflexão crítica sobre o desenvolvimento do MVP, considerando o atendimento aos objetivos definidos, as dificuldades enfrentadas, os aprendizados adquiridos e oportunidades de evolução futura.

---

## 1. Atingimento dos Objetivos

De forma geral, considero que o MVP atingiu plenamente os objetivos propostos pela disciplina.  
Os pontos mais relevantes alcançados foram:

- Construção de um pipeline completo em camadas (Bronze → Silver → Gold) utilizando PySpark e Delta Lake.
- Organização do projeto segundo princípios de arquitetura Lakehouse.
- Documentação estruturada de acordo com o padrão exigido pela PUC Rio Digital.
- Análise aprofundada do fenômeno de turnover, com respostas claras para as perguntas de negócio definidas previamente.
- Desenvolvimento de visualizações e métricas consistentes que permitem interpretações fundamentadas.

O projeto também demonstrou capacidade de conectar **engenharia de dados**, **qualidade de dados** e **análise exploratória** em um fluxo coerente, robusto e replicável.

---

## 2. Dificuldades Enfrentadas

Durante o desenvolvimento, algumas dificuldades se destacaram:

### • Ajustes em PySpark e Delta Lake  
Foi necessário revisar diversas funções de transformação até chegar à padronização final das camadas Silver e Gold.  
Funções como `withColumn`, `when`, `agg` e tratativas de tipos exigiram atenção especial.

### • Organização da modelagem dimensional  
Embora o dataset seja relativamente simples, estruturar um modelo estrela que fosse ao mesmo tempo didático e coerente com boas práticas exigiu reflexão sobre granularidade, chaves e separação de dimensões.

### • Documentação em padrão acadêmico  
A construção da documentação completa (objetivo, origem dos dados, catálogo, modelagem, análises, conclusão e autoavaliação) exigiu bastante tempo de refinamento para garantir clareza, consistência e aderência às diretrizes.

### • Execução fora do Databricks  
Como o MVP foi desenvolvido em Jupyter Notebook e não diretamente na plataforma Databricks, foi necessário adaptar as instruções de execução para serem compatíveis com ambos os ambientes.

---

## 3. Aprendizados Adquiridos

Este MVP proporcionou aprendizados significativos:

- Maior domínio sobre o ecossistema Spark e Lakehouse.
- Melhora na capacidade de projetar pipelines estruturados e escaláveis.
- Entendimento aplicado de como tratar um problema real de RH utilizando dados.
- Evolução na escrita técnica, documentação e boas práticas de versionamento.
- Maior consciência da importância da camada Silver como etapa crítica de refinamento analítico.

Além disso, trabalhar com métricas de turnover fortaleceu a habilidade de interpretar indicadores organizacionais e conectá-los a decisões de negócio.

---

## 4. Pontos a Melhorar

Mesmo com a entrega completa, alguns aspectos poderiam ser aperfeiçoados:

- Criar mecanismos de orquestração automatizada (Airflow ou Databricks Jobs).
- Expandir análises para incluir hipóteses adicionais, como absenteísmo (não disponível nesta base).
- Inserir testes automatizados de qualidade de dados (Great Expectations ou Deequ).
- Implementar versionamento de dados e time-travel como parte formal da arquitetura.

---

## 5. Trabalhos Futuros

Algumas evoluções planejadas para uma versão estendida do projeto:

### • Modelo preditivo de churn  
Treinar um classificador para prever desligamentos utilizando variáveis comportamentais e organizacionais.

### • Dashboard final  
Criar visualizações executivas (Power BI ou Databricks SQL Dashboard) para RH e liderança.

### • Novo pipeline com orquestração  
Transformar o MVP em um fluxo contínuo com monitoramento e logs.

### • Inclusão de novas fontes de dados  
Adicionar dados como:
- avaliações de performance,
- absenteísmo,
- feedbacks de clima organizacional,
- trilhas de carreira.

---

## 6. Conclusão da Autoavaliação

O desenvolvimento do MVP foi uma experiência completa, combinando engenharia, análise e reflexão crítica.  
Saio do projeto com maior confiança técnica e consciência sobre boas práticas em pipelines de dados.  
Sinto que o trabalho representa com fidelidade a proposta da disciplina e que atende aos critérios para avaliação máxima.

