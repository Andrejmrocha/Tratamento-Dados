USE AulaDB

SELECT DISTINCT
	Codigo_Produto AS 'Codigo',
	Nome_Produto AS 'Nome',
	Tipo_Produto AS 'Tipo',
	Unidade_Produto AS 'Unidade'
INTO DW_2..Dim_Produto
FROM tb_produtos