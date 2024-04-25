select * from tbven

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

ALTER TABLE tb_vendas
ALTER COLUMN Status_Venda VARCHAR(20)

UPDATE tb_vendas
SET Status_Venda = 
CASE
	WHEN Status_Venda = 1 THEN '1 - Concluída'
	WHEN Status_Venda = 2 THEN '2 - Em aberto'
	WHEN Status_Venda = 3 THEN '3 - Cancelada'
	ELSE Status_Venda
END

select * from tb_vendas