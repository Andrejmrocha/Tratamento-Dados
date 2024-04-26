USE AulaDB

SELECT DISTINCT
	Codigo_Venda AS 'Codigo',
	Data_Venda AS 'Data',
	Codigo_Cliente AS 'Codigo_Cliente',
	canal AS 'Canal_venda',
	Status_Venda AS 'Status',
	deleted AS 'Deletada',
	Codigo_Vendedor AS 'Codigo_Vendedor'
INTO DW_2..Fato_Vendas
FROM tb_vendas


