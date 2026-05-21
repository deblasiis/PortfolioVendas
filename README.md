# Dashboard de Análise de Vendas E-commerce 📊
<img width="1279" height="1007" alt="Captura de tela 2026-05-20 113741" src="https://github.com/user-attachments/assets/450a3f2c-8d8e-4d2e-a6e9-6e1d76f46e72" />
Este projeto consiste no desenvolvimento de uma solução de Business Intelligence de ponta a ponta, integrando um banco de dados relacional local à uma camada de modelagem, cálculo e visualização de dados. O objetivo principal é monitorar os principais KPIs de vendas, performance de equipe e distribuição regional de receita.

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** MySQL (Structured Query Language)
* **Ferramenta de BI:** Power BI Desktop
* **Linguagem de Cálculo:** DAX (Data Analysis Expressions)
* **Engenharia de Dados/ETL:** Power Query

---

## 📐 Arquitetura e Modelagem dos Dados (Star Schema)
Para garantir a performance das consultas e seguir as melhores práticas de mercado, os dados foram estruturados em um modelo dimensional **Esquema Estrela (Star Schema)** diretamente no MySQL:
Usei nome de tabelas fato e dimensão, porque eu estava aprendendo sobre elas.
* **Tabela Fato:** `fato_vendas` (Métricas de transações, quantidades e valores).
* **Tabelas Dimensão:** * `dim_clientes` (Dados demográficos: Cidade, Estado).
  * `dim_produtos` (Catálogo: Nome do Produto, Categoria, Preço Unitário).
  * `dim_vendedores` (Estrutura comercial: Nome do Vendedor, Equipe/Região).

---

## 🧠 Desafios Técnicos Solucionados (ETL & Data Quality)
Durante a fase de ingestão e tratamento dos dados no Power Query, foram solucionados problemas críticos de qualidade de dados:
1. **Tratamento de Notação Científica e Ponto Flutuante:** Dados numéricos brutos foram convertidos e tipados estritamente como *Número Decimal Fixo (Currency/Moeda)* para eliminar inconsistências de precisão computacional geradas por dízimas em ponto flutuante.
2. **Conflito de Localidade (Locale):** Ajuste de regras regionais de importação (conversão do formato americano `en-US` para o padrão brasileiro `pt-BR`) para mitigar erros de conversão de texto para decimal causados pela inversão de pontos e vírgulas.

---

## 📈 Métricas Implementadas (Linguagem DAX)
As regras de negócio foram criadas utilizando medidas calculadas dinâmicas:

* **Faturamento Bruto:**
  ```dax
  Faturamento Bruto = SUM('bd_vendas_portfolio fato_vendas'[valor_total])
  Total Pedidos = COUNTROWS('bd_vendas_portfolio fato_vendas')
  Ticket Médio = DIVIDE([Faturamento Bruto], [Total Pedidos])

---
## Vendas 2025

## 📅 Atualização do Projeto: Análise Anual Consolidada (Base Histórica 2025)
Para expandir o escopo do projeto e analisar o comportamento de mercado a longo prazo, implementei uma carga de dados histórica cobrindo o ano cheio de 2025 (122 transações).

### 📈 Insights Estratégicos Reais Obtidos:
O Verdadeiro Pico do Ano: O faturamento explodiu logo no começo, em Janeiro, batendo quase R$ 800k (R$ 788.830,00).

O Ponto Crítico (Pior Mês): A maior queda histórica aconteceu em Abril, onde o faturamento despencou para menos de R$ 50k (R$ 46.650,00).

Recuperação: Logo após o tombo de abril, o mercado se recuperou fortemente em Maio, voltando para a faixa dos R$ 511.000.

Líder de Vendas: O vendedor que mais trouxe receita foi o Carlos Souza (somando R$ 1.657.000,00), e não o Bruno.

Estado Campeão: O estado que disparou no topo do faturamento foi São Paulo (SP), acumulando mais de R$ 1.930.000.

<img width="1742" height="978" alt="image" src="https://github.com/user-attachments/assets/4efc7115-64c4-4f7f-aeb3-43bdbe8db484" />
