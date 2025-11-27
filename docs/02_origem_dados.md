# 📄 Origem dos Dados  
## MVP – Pipeline de Dados em Nuvem para Análise de Turnover

---

## 1. Dataset Selecionado

O conjunto de dados utilizado neste MVP é:

**IBM HR Analytics Employee Attrition & Performance**  
Disponível publicamente no Kaggle em:  
🔗 https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset

Este dataset é amplamente utilizado em estudos de Ciência de Dados, Machine Learning, Recursos Humanos e People Analytics. Ele contém informações detalhadas sobre colaboradores, incluindo dados de satisfação, carga de trabalho, jornada, salário, demografia e métricas de desempenho, possibilitando análises profundas sobre turnover (*attrition*).

---

## 2. Autor da Base

O dataset foi publicado no Kaggle pelo usuário:

**Autor:** *pavansubhasht*  
📌 https://www.kaggle.com/pavansubhasht

O arquivo é disponibilizado de forma pública e gratuita para uso acadêmico, experimental e de portfólio.

---

## 3. Licença e Direitos de Uso

A página do dataset no Kaggle não especifica uma licença formal restritiva (como MIT, CC-BY ou GPL).  
Assim, ele se enquadra na categoria de **Open Dataset disponibilizado pelo autor**, podendo ser utilizado para fins educacionais, estudos e projetos de portfólio.

Em conformidade com as orientações da instituição:

> Todo o uso dos dados neste MVP respeita os termos de disponibilização definidos pelo autor no Kaggle. Nenhum dado pessoal sensível é utilizado.  

Além disso, este projeto segue práticas éticas descritas pela LGPD e pelos princípios apresentados na disciplina de **Segurança e Aspectos Éticos de Dados**.

---

## 4. Formato dos Arquivos Disponibilizados

O dataset contém o arquivo:

- `WA_Fn-UseC_-HR-Employee-Attrition.csv`  
Formato: **CSV**, delimitado por vírgulas.

Número aproximado de registros: **~1.470 colaboradores**  
Número aproximado de colunas: **35 atributos**

---

## 5. Relevância para o MVP

A base foi escolhida por diversos motivos:

- Possui **informações completas e ricas** para análise de turnover.  
- É amplamente utilizada como referência acadêmica e profissional.  
- Permite análises estatísticas, exploratórias e construção de modelos preditivos.  
- Contém variáveis categóricas, numéricas e de comportamento, que suportam a construção de dashboards e modelos dimensionais.  
- Os dados são limpos o suficiente para viabilizar o pipeline, mas complexos o bastante para exigir **tratamento, ETL e análise de qualidade**, atendendo os requisitos do MVP.

---

## 6. Forma de Obtenção

O dataset foi obtido através de download direto da plataforma Kaggle, sendo posteriormente enviado para a plataforma Databricks durante a etapa de ingestão da camada Bronze.

Evidências do processo de ingestão serão incluídas na pasta `/imgs` e nos notebooks em `/notebooks`.

---

## 7. Considerações Éticas

Conforme orientado pela instituição:

- O dataset **não contém dados pessoais reais**, apenas dados sintéticos gerados para fins de estudo.
- Nenhuma informação sensível, identificável ou protegida por LGPD é usada.
- Todos os passos de ingestão e armazenamento seguem boas práticas de segurança de dados.
- A base é utilizada exclusivamente para fins educacionais, de pesquisa e de desenvolvimento de portfólio.

---

## 8. Conclusão

Este documento registra oficialmente a origem, licença, autor e justificativa da escolha do dataset utilizado no MVP.  
Com esta etapa concluída, o próximo passo é iniciar a ingestão na camada **Bronze** na plataforma Databricks.

