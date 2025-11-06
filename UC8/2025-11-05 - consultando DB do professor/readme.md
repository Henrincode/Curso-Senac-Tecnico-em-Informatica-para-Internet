# Consultando banco de dados do professor `mercado`

Aqui vamos consultar o banco de dados do professor e tentar fazer engenharia reversa para fazer o banco funcionar com relação de chaves estrangeiras usando inner join.

## Consultando todos os produtos

```sql
SELECT * FROM produtos
```
- Retornou FK de outras tabelas `id_categoria` e `id_fornecedor`, entendendo que existem tabelas categorias e fornecedores, então vamos consultar as tabelas:

```sql
SELECT * FROM categorias
```

- Pode-se ver que tem colunas id_categoria, nome e descrição, agora consultar a tabela fornecedores:

```sql
SELECT * FROM fornecedores
```

- Pode-se ver que tem colunas id_fornecedor, nome, cnpj, telefone, email, e endereco.

## Fazendo consulta na tabela produtos e relacionando categorias e fornecedores

```sql

SELECT
    p.id_produto as id,
    p.nome,
    p.preco,
    p.quantidade_estoque,
    ca.nome as categoria,
    fo.nome as fornecedor
FROM produtos p
INNER JOIN categorias ca
    ON p.id_categoria = ca.id_categoria
INNER JOIN fornecedores fo
    ON p.id_fornecedor = fo.id_fornecedor
```

## Fazendo o mesmo procedimento com a tabela `itens_venda`

```sql
select
	iv.id_item_venda as id_item,
	ve.id_venda as id_venda,
	pr.nome as produto,
	ca.nome as categoria,
	pr.preco,
	ve.valor_total,
	ve.data_venda,
	cl.nome as comprador
from itens_venda iv
inner join vendas ve on iv.id_venda = ve.id_venda
inner join clientes cl on ve.id_cliente = cl.id_cliente 
inner join produtos pr on iv.id_produto = pr.id_produto 
inner join categorias ca on pr.id_categoria = ca.id_categoria 
inner join fornecedores fo on pr.id_fornecedor = fo.id_fornecedor
```