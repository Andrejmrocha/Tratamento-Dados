# **Atividade 2 - Tratamento de base de dados**

### Banco de dados inicial: [Link do backup](https://github.com/aasouzaconsult/SAD/blob/main/bd_erp.bak)

## Tabela Dependentes
```
SELECT * FROM tbdep;
```
![tbdep](https://github.com/Andrejmrocha/Tratamento-Dados/blob/abcf9953ecd3de4363923783ecfc9ba1fcfd169f/Assets/tbdep.png)

<hr>

## Tabela Produtos
```
SELECT * FROM tbpro;
```
![tbpro](https://github.com/Andrejmrocha/Tratamento-Dados/blob/abcf9953ecd3de4363923783ecfc9ba1fcfd169f/Assets/tbpro.png)

<hr>

## Tabela Vendedor
```
SELECT * FROM tbvdd;
```
![tbvdd](https://github.com/Andrejmrocha/Tratamento-Dados/blob/abcf9953ecd3de4363923783ecfc9ba1fcfd169f/Assets/tbvdd.png)

<hr>

## Tabela Vendas
```
SELECT * FROM tbven;
```
![tbven](https://github.com/Andrejmrocha/Tratamento-Dados/blob/abcf9953ecd3de4363923783ecfc9ba1fcfd169f/Assets/tbven.png)

<hr>

## Tabela Vendas_Item
```
SELECT * FROM tbven_item;
```
![tbven_item](https://github.com/Andrejmrocha/Tratamento-Dados/blob/abcf9953ecd3de4363923783ecfc9ba1fcfd169f/Assets/tbven_item.png)

## Tratamento - Tabela Dependentes
Buscando uma melhor compreensão dos dados, vou renomear o nome das colunas, pois todas estão abreviadas.
```
EXEC sp_rename 'tbdep', 'tb_dependentes'

EXEC sp_rename 'tb_dependentes.cddep', 'Codigo_Dependente'
EXEC sp_rename 'tb_dependentes.nmdep', 'Nome_Dependente'
EXEC sp_rename 'tb_dependentes.dtnasc', 'Data_Nascimento_Dependente'
EXEC sp_rename 'tb_dependentes.sxdep', 'Sexo_Dependente'
EXEC sp_rename 'tb_dependentes.cdvdd', 'Codigo_Vendedor'
```

Além de renomear as colunas irei remover o espaço desnecessário que está no Dependente de Código 3;
```
DECLARE @Sexo VARCHAR(2)
SELECT @Sexo = Sexo_Dependente FROM tb_dependentes WHERE Codigo_Dependente = 3

UPDATE tb_dependentes
SET Sexo_Dependente = TRIM(@Sexo)
WHERE Codigo_Dependente = 3
```

```
SELECT * FROM tb_dependentes
```
![tb_dependentes](https://github.com/Andrejmrocha/Tratamento-Dados/blob/976812f7653653c270f21be1a27504cab63ab9d2/Assets/tbdependentes.png)

## Tratamento - Tabela Produtos
Buscando uma melhor compreensão dos dados, vou renomear o nome das colunas, pois todas estão abreviadas. 

```
EXEC sp_rename 'tbpro', 'tb_produtos'

EXEC sp_rename 'tb_produtos.cdpro', 'Codigo_Produto'
EXEC sp_rename 'tb_produtos.nmpro', 'Nome_Produto'
EXEC sp_rename 'tb_produtos.tppro', 'Tipo_Produto'
EXEC sp_rename 'tb_produtos.undpro', 'Unidade_Produto'
EXEC sp_rename 'tb_produtos.slpro', 'Saldo_Produto'
EXEC sp_rename 'tb_produtos.stpro', 'Status_Produto'
```

Produto TO não tem tipo nem unidade, então estarei deletando da base

```
DELETE FROM tb_produtos WHERE Tipo_Produto IS NULL
```

```
SELECT * FROM tb_produtos
```
![tb_produtos](https://github.com/Andrejmrocha/Tratamento-Dados/blob/976812f7653653c270f21be1a27504cab63ab9d2/Assets/tbprodutos.png)

## Tratamento - Tabela Vendedores
Buscando uma melhor compreensão dos dados, vou renomear o nome das colunas, pois todas estão abreviadas. 

```
EXEC sp_rename 'tbvdd', 'tb_vendedores'

EXEC sp_rename 'tb_vendedores.cdvdd', 'Codigo_Vendedor'
EXEC sp_rename 'tb_vendedores.nmvdd', 'Nome_Vendedor'
EXEC sp_rename 'tb_vendedores.sxvdd', 'Sexo_Vendedor'
EXEC sp_rename 'tb_vendedores.perccomissao', 'Percentual_Comissao'
EXEC sp_rename 'tb_vendedores.matfunc', 'Matricula_Funcionario'
```

Vou remover o espaço desnecessário que tem no nome de alguns vendedores
```
DECLARE @Nome VARCHAR(11)
SELECT @Nome = Nome_Vendedor FROM tb_vendedores WHERE Codigo_Vendedor = 3

UPDATE tb_vendedores
SET Nome_Vendedor =	 TRIM(@Nome)
WHERE Codigo_Vendedor = 3

DECLARE @Nome VARCHAR(11)
SELECT @Nome = Nome_Vendedor FROM tb_vendedores WHERE Codigo_Vendedor = 5

UPDATE tb_vendedores
SET Nome_Vendedor =	 TRIM(@Nome)
WHERE Codigo_Vendedor = 5
```

Irei atualizar o nome do último vendedor, que está nulo, poderia remover, mas seguindo o padrão dos demais vou adotar o nome Vendedor 11
```
UPDATE tb_vendedores
SET Nome_Vendedor =	 'Vendedor 11'
WHERE Codigo_Vendedor = 11
```

Buscando melhorar a compreensão da variável sexo do vendedor, vou adotar o número 1 como masculino e 0 como feminino.

```
ALTER TABLE tb_vendedores
ALTER COLUMN Sexo_Vendedor VARCHAR(1)

UPDATE tb_vendedores
SET Sexo_Vendedor = 'M'
WHERE Sexo_Vendedor = '1'

UPDATE tb_vendedores
SET Sexo_Vendedor = 'F'
WHERE Sexo_Vendedor = '0'
```
```
SELECT * FROM tb_vendedores
```
![tb_vendedores](https://github.com/Andrejmrocha/Tratamento-Dados/blob/976812f7653653c270f21be1a27504cab63ab9d2/Assets/tbvendedores.png)

## Tratamento - Tabela Vendas
Buscando uma melhor compreensão dos dados, vou renomear o nome das colunas, pois todas estão abreviadas. 

```
EXEC sp_rename 'tbven', 'tb_vendas'

EXEC sp_rename 'tb_vendas.cdven', 'Codigo_Venda'
EXEC sp_rename 'tb_vendas.dtven', 'Data_Venda'
EXEC sp_rename 'tb_vendas.cdcli', 'Codigo_Cliente'
EXEC sp_rename 'tb_vendas.nmcli', 'Nome_Cliente'
EXEC sp_rename 'tb_vendas.agecli', 'Idade_Cliente'
EXEC sp_rename 'tb_vendas.clacli', 'Classificação_Cliente'
EXEC sp_rename 'tb_vendas.sxcli', 'Sexo_Cliente'
EXEC sp_rename 'tb_vendas.cidcli', 'Cidade_Cliente'
EXEC sp_rename 'tb_vendas.estcli', 'Estado_Cliente'
EXEC sp_rename 'tb_vendas.paicli', 'Pais_Cliente'
EXEC sp_rename 'tb_vendas.stven', 'Status_Venda'
EXEC sp_rename 'tb_vendas.cdvdd', 'Codigo_Vendedor'
```

Vou adicionar uma descrição para os status de venda
```
UPDATE tb_vendas
SET Status_Venda = 
CASE
	WHEN Status_Venda = 1 THEN '1 - Concluída'
	WHEN Status_Venda = 2 THEN '2 - Em aberto'
	WHEN Status_Venda = 3 THEN '3 - Cancelada'
	ELSE Status_Venda
END
```

```
SELECT * FROM tb_vendas
```
![tb_vendas](https://github.com/Andrejmrocha/Tratamento-Dados/blob/976812f7653653c270f21be1a27504cab63ab9d2/Assets/tbvendas.png)

## Tratamento - Tabela Vendas_Item
Buscando uma melhor compreensão dos dados, vou renomear o nome das colunas, pois todas estão abreviadas. Além disso vou padronizar a nomenclatura produto no lugar de item

```
EXEC sp_rename 'tbven_item', 'tb_venda_produto'

EXEC sp_rename 'tb_venda_produto.cdvenitem', 'Codigo_Venda_Produto'
EXEC sp_rename 'tb_venda_produto.cdpro', 'Codigo_Produto'
EXEC sp_rename 'tb_venda_produto.qtven', 'Quantidade_Venda'
EXEC sp_rename 'tb_venda_produto.vruven', 'Valor_Unitario_Venda'
EXEC sp_rename 'tb_venda_produto.vrtven', 'Valor_Total_Venda'
EXEC sp_rename 'tb_venda_produto.cdven', 'Codigo_Venda'
```

Atualizando os valores totais de venda
````
UPDATE tb_venda_produto
SET Valor_Total_Venda = Quantidade_Venda * Valor_Unitario_Venda
```

```
SELECT * FROM tb_venda_produto
```
![tb_vendas_item](https://github.com/Andrejmrocha/Tratamento-Dados/blob/976812f7653653c270f21be1a27504cab63ab9d2/Assets/tbvendas_item.png)

