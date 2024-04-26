USE AulaDB

SELECT DISTINCT
	Codigo_Vendedor AS 'Codigo',
	Nome_Vendedor AS 'Nome',
	Sexo_Vendedor AS 'Sexo',
	Percentual_Comissao AS 'Comissao_percentual',
	Matricula_Funcionario AS 'Matricula'
INTO DW_2..Dim_Vendedores
FROM tb_vendedores

