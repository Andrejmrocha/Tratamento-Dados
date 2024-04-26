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
```
UPDATE tb_venda_produto
SET Valor_Total_Venda = Quantidade_Venda * Valor_Unitario_Venda
```

```
SELECT * FROM tb_venda_produto
```

![tb_vendas_item](https://github.com/Andrejmrocha/Tratamento-Dados/blob/976812f7653653c270f21be1a27504cab63ab9d2/Assets/tbvendas_item.png)

## Date Warehouse

Para a criação do Date Warehouse vou instanciar um novo banco de dados
```
USE MASTER;
CREATE DATABASE DW_2;
```

Iniciando a criação das dimensões
* Cliente
```
USE AulaDB

SELECT DISTINCT
	Codigo_Cliente AS 'Codigo',
	Nome_Cliente AS 'Nome',
	Idade_Cliente AS 'Idade',
	Classificação_Cliente AS 'Classificação',
	Sexo_Cliente AS 'Sexo',
	Cidade_Cliente AS 'Cidade',
	Estado_Cliente AS 'Estado',
	Pais_Cliente AS 'País'
INTO DW_2..Dim_Clientes
FROM tb_vendas
```
![Dim_Cliente](https://github.com/Andrejmrocha/Tratamento-Dados/blob/3f8d32f9bc7015065227e9f85bd7cd06d3ef1962/Assets/Dim_Cliente.png)

* Dependentes
```
USE AulaDB

SELECT DISTINCT
	Codigo_Dependente AS 'Codigo',
	Nome_Dependente AS 'Nome',
	Data_Nascimento_Dependente AS 'Data_Nascimento',
	Sexo_Dependente AS 'Sexo',
	Codigo_Vendedor AS 'Responsavel',
	inepescola AS 'Codigo_Escola_INEP'
INTO DW_2..Dim_Dependente
FROM tb_dependentes
```
![Dim_Dependentes](https://github.com/Andrejmrocha/Tratamento-Dados/blob/3f8d32f9bc7015065227e9f85bd7cd06d3ef1962/Assets/Dim_Dependente.png)

* Produtos
```
USE AulaDB

SELECT DISTINCT
	Codigo_Produto AS 'Codigo',
	Nome_Produto AS 'Nome',
	Tipo_Produto AS 'Tipo',
	Unidade_Produto AS 'Unidade'
INTO DW_2..Dim_Produto
FROM tb_produtos
```
![Dim_Produtos](https://github.com/Andrejmrocha/Tratamento-Dados/blob/3f8d32f9bc7015065227e9f85bd7cd06d3ef1962/Assets/Dim_Produto.png)

* Vendedores
```
USE AulaDB

SELECT DISTINCT
	Codigo_Vendedor AS 'Codigo',
	Nome_Vendedor AS 'Nome',
	Sexo_Vendedor AS 'Sexo',
	Percentual_Comissao AS 'Comissao_percentual',
	Matricula_Funcionario AS 'Matricula'
INTO DW_2..Dim_Vendedores
FROM tb_vendedores
```
![Dim_Vendedores](https://github.com/Andrejmrocha/Tratamento-Dados/blob/3f8d32f9bc7015065227e9f85bd7cd06d3ef1962/Assets/Dim_Vendedor.png)

* Calendário
```
USE DW_2
CREATE TABLE Dim_Calendario (
    Data DATE PRIMARY KEY,
    Ano INT,
    Mes INT,
    Dia INT,
    Dia_Semana INT,
    Nome_Dia VARCHAR(20),
    Nome_Mes VARCHAR(20),
    Trimestre INT,
    Semestre INT
);

DECLARE @StartDate DATE = '2010-01-01';
DECLARE @EndDate DATE = '2030-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO Dim_Calendario (Data, Ano, Mes, Dia, Dia_Semana, Nome_Dia, Nome_Mes, Trimestre, Semestre)
    SELECT
        @StartDate AS Data,
        YEAR(@StartDate) AS Ano,
        MONTH(@StartDate) AS Mes,
        DAY(@StartDate) AS Dia,
        DATEPART(WEEKDAY, @StartDate) AS Dia_Semana,
        DATENAME(WEEKDAY, @StartDate) AS Nome_Dia,
        DATENAME(MONTH, @StartDate) AS Nome_Mes,
        CEILING(MONTH(@StartDate) / 3.0) AS Trimestre,
        CEILING(MONTH(@StartDate) / 6.0) AS Semestre;

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END
```
![Dim_Cal](https://github.com/Andrejmrocha/Tratamento-Dados/blob/3f8d32f9bc7015065227e9f85bd7cd06d3ef1962/Assets/Dim_Calendario.png)

Finalizando com fato Venda
```
USE AulaDB;

SELECT DISTINCT
	Codigo_Venda AS 'Codigo',
	Data_Venda AS 'Data',
	Codigo_Cliente AS 'Codigo_Cliente',
	canal AS 'Canal_venda',
	Status_Venda AS 'Status',
	deleted AS 'Deletada',
	Codigo_Vendedor AS 'Codigo_Vendedor'
INTO DW_2..Fato_Vendas
FROM tb_vendas;
```

![Fato_Vendas](https://github.com/Andrejmrocha/Tratamento-Dados/blob/3f8d32f9bc7015065227e9f85bd7cd06d3ef1962/Assets/Fato_Vendas.png)