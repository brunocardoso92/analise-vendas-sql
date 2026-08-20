# Análise de Vendas com SQL

Projeto de portfólio para praticar **SQL aplicado à análise de dados e negócios** usando SQLite.

A base é totalmente **fictícia**, criada para fins educacionais. O cenário simula uma empresa de varejo com clientes, produtos, pedidos, itens e pagamentos.

> **Nível do projeto:** iniciante/em desenvolvimento. O objetivo é documentar a evolução prática em SQL e raciocínio analítico.

## Objetivos

- praticar `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING` e agregações;
- combinar tabelas com `JOIN`;
- calcular receita e ticket médio;
- analisar produtos, clientes, regiões e evolução mensal;
- identificar pagamentos pendentes e atrasados;
- praticar CTEs e funções de janela.

## Estrutura

```text
analise-vendas-sql/
├── database/analise_vendas.db
├── data/
├── docs/dicionario_dados.md
├── sql/
│   ├── 01_exploracao_basica.sql
│   ├── 02_filtros_agregacoes.sql
│   ├── 03_joins.sql
│   ├── 04_indicadores_negocio.sql
│   ├── 05_receita_mensal.sql
│   ├── 06_risco_inadimplencia.sql
│   ├── 07_desafio_extra.sql
│   └── 08_analise_executiva.sql
└── README.md
```

## Como executar

1. Abra `database/analise_vendas.db` no **DB Browser for SQLite**.
2. Acesse **Execute SQL**.
3. Rode os scripts da pasta `sql/` em ordem.

## Perguntas de negócio

1. Quantos pedidos existem por status e canal?
2. Quais categorias possuem maior preço médio?
3. Quais clientes geraram maior receita?
4. Quais produtos tiveram maior volume e receita?
5. Qual é a receita total e o ticket médio?
6. Como a receita evoluiu por mês?
7. Qual é a exposição financeira em pagamentos pendentes e atrasados?
8. Quais clientes têm maior valor em aberto?
9. Qual é o ranking de clientes por receita?

## Análise executiva

O projeto consolida indicadores comerciais e financeiros, incluindo receita total, ticket médio, clientes e produtos com maior faturamento, vendas por região, pagamentos pendentes ou atrasados e participação da receita por categoria.

## Competências praticadas no projeto

SQL, SQLite, modelagem relacional, JOINs, agregações, CTEs, funções de janela, análise de dados, indicadores de negócio e análise de risco - todas em desenvolvimento por meio deste portfólio.

## Autor

**Bruno Cardoso**

- [LinkedIn](https://www.linkedin.com/in/bruno-cardoso92/)
- [GitHub](https://github.com/brunocardoso92)
