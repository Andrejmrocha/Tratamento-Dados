USE AulaDB

SELECT DISTINCT
	Codigo_Cliente AS 'Codigo',
	Nome_Cliente AS 'Nome',
	Idade_Cliente AS 'Idade',
	Classifica��o_Cliente AS 'Classifica��o',
	Sexo_Cliente AS 'Sexo',
	Cidade_Cliente AS 'Cidade',
	Estado_Cliente AS 'Estado',
	Pais_Cliente AS 'Pa�s'
INTO DW_2..Dim_Clientes
FROM tb_vendas


