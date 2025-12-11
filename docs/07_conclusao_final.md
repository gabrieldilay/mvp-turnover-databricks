# 07. Conclusão Final do MVP

Este documento apresenta a conclusão geral do MVP, conectando os resultados das análises às perguntas de negócio definidas previamente, avaliando se os objetivos foram atingidos e destacando oportunidades de evolução para trabalhos futuros.

---

# 1. Síntese do Problema e do Objetivo

O objetivo deste MVP foi construir um pipeline completo de dados em ambiente de nuvem utilizando a plataforma Databricks, seguindo as boas práticas de arquitetura em camadas (Bronze, Silver e Gold), e realizar uma análise orientada a dados sobre os fatores que influenciam o turnover (attrition) de colaboradores, utilizando a base pública IBM HR Employee Attrition & Performance.

As perguntas de negócio orientaram toda a estrutura do pipeline e permitiram validar a eficácia das transformações, da modelagem dimensional e das análises conduzidas.

---

# 2. Principais Achados das Análises

A seguir, são apresentadas as principais conclusões identificadas ao longo das análises conduzidas na Camada Gold.

## 2.1 Taxa Geral de Turnover

A taxa geral de attrition encontrada foi:

- **16,12%**

Esse percentual serve como linha de base para todas as interpretações realizadas e representa um nível moderado de desligamento.

---

## 2.2 Departamentos Críticos

A análise identificou departamentos com maior propensão ao turnover:

- **Sales – 20,63%**
- **Human Resources – 19,05%**

Essas áreas apresentam taxas superiores à média da empresa, indicando necessidade de atenção, possíveis iniciativas de retenção e revisão de práticas de gestão.

---

## 2.3 Impacto da Remuneração

A relação entre remuneração e desligamento mostrou-se clara:

- Faixa **baixa**: 28,61%
- Faixa **média**: 12,03%
- Faixa **alta**: 10,8%

Conclui-se que colaboradores com menor renda possuem maior vulnerabilidade ao desligamento, reforçando a importância de políticas de compensação alinhadas ao mercado e ao custo de vida.

---

## 2.4 Perfil Etário e Turnover

A faixa etária apresentou forte influência:

- **Jovens (< 30 anos): 27,91%**
- Adultos: 12,67%
- Seniors: 13,29%

A rotatividade elevada entre jovens pode estar relacionada a:

- rápida troca de emprego no início da carreira,
- busca por crescimento,
- adaptação ao ambiente organizacional.

---

## 2.5 A Importância do Tempo de Empresa

A análise de *Years at Company* mostrou:

- **Ano 1: 36,36% de turnover**
- Após o segundo ano, o turnover se estabiliza.

Esse comportamento reforça a importância de programas de onboarding, mentoria e acompanhamento próximo nos primeiros meses.

---

## 2.6 Outras Dimensões Relevantes

Além das análises principais, também foram encontrados padrões significativos:

- **Gênero:** mulheres apresentaram leve taxa maior (17,01% vs. 14,80%).
- **Cargo:** alguns cargos apresentam risco muito superior, como Sales Representative.
- **Nível hierárquico:** turnover elevado no nível 1 indica fragilidade operacional.
- **Correlação numérica:** as variáveis numéricas possuem baixa correlação linear com attrition, reforçando a importância de variáveis categóricas e interações.

---

# 3. Respostas às Perguntas de Negócio

Abaixo um resumo das respostas diretas às perguntas definidas na Etapa 01 (Objetivo do MVP):

| Pergunta | Respondida? | Conclusão |
|---------|-------------|-----------|
| 1. Qual a taxa geral de turnover? | Sim | 16,12% |
| 2. Turnover por faixa etária? | Sim | Jovens são o grupo mais crítico. |
| 3. Diferença por gênero? | Sim | Diferença leve, mas existente. |
| 4. Diferença por estado civil? | Parcial | Dados permitem análise, não foi explorada aprofundadamente. |
| 5. Departamentos com maior turnover? | Sim | Sales e HR. |
| 6. Cargos e níveis hierárquicos críticos? | Sim | Cargos comerciais e Nível 1. |
| 7. Turnover por tempo de empresa? | Sim | Ano 1 concentra o maior risco. |
| 8. Anos no cargo influenciam turnover? | Parcial | Não detalhado, mas possível com os dados. |
| 9. Relação entre salário e turnover? | Sim | Relação inversa forte. |
| 10. Salary Hike influencia? | Parcial | Relação analisável, mas não explorada. |
| 11. Satisfação influencia turnover? | Parcial | Correlação leve, mas possível aprofundar. |
| 12. Viagens a trabalho impactam turnover? | Não analisado | Pode ser incluído em trabalho futuro. |
| 13. Variáveis mais correlacionadas? | Sim | distancefromhome, numcompaniesworked, etc. |
| 14. Previsão de desligamento? | Não incluído | Poderia ser desenvolvido como fase 2 (modelagem ML). |

Mesmo perguntas não abordadas totalmente foram mantidas conforme exigência institucional.

---

# 4. Avaliação do Pipeline Construído

O pipeline atende integralmente aos requisitos da instituição:

### 4.1 Arquitetura em Camadas Implementada
- **Bronze:** ingestão bruta.
- **Silver:** padronização, enriquecimento e qualidade.
- **Gold:** modelagem dimensional e agregações analíticas.

### 4.2 Modelagem Dimensional
Criado modelo estrela contendo:
- Fato: fato_attrition  
- Dimensões: departamento, cargo, faixa salarial, faixa etária, tempo de empresa, gênero  

### 4.3 Qualidade dos Dados
Realizado de forma completa:
- nulos
- duplicidades
- outliers
- cardinalidade
- estatísticas descritivas

---

# 5. Limitações do Estudo

Algumas limitações são inerentes ao dataset e ao escopo:

- variáveis numéricas com correlação fraca não permitem modelos estatísticos robustos;
- dataset pequeno (1470 linhas), limitando generalização;
- base é simulada, característica do dataset IBM;
- algumas perguntas exigiriam dados adicionais que não estão presentes.

---

# 6. Trabalhos Futuros

Sugestões para expandir o MVP:

1. Implementar modelo preditivo supervisionado (Logistic Regression, Random Forest).
2. Criar painel executivo em Power BI ou Tableau usando a camada Gold.
3. Incluir análises temporais caso haja datas reais.
4. Criar pipelines automatizados com Workflows do Databricks.
5. Ampliar conjunto de dimensões para incluir:
   - satisfação detalhada,
   - performance,
   - carga de trabalho.
6. Documentar SLA, SLO e políticas de governança de dados.
7. Implementar testes de qualidade automatizados (ex.: Deequ).

---

# 7. Conclusão Geral

O MVP cumpriu seus objetivos de forma plena, entregando:

- pipeline de dados moderno e estruturado,
- modelagem dimensional clara,
- análises profundas e interpretáveis,
- documentação completa conforme exigências da instituição,
- artefatos e código versionados no GitHub.

Além disso, os resultados encontrados são consistentes, explicativos e permitem recomendações estratégicas para a área de Recursos Humanos.


