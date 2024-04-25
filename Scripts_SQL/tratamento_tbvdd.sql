select * from tbvdd

EXEC sp_rename 'tbvdd', 'tb_vendedores'

EXEC sp_rename 'tb_vendedores.cdvdd', 'Codigo_Vendedor'
EXEC sp_rename 'tb_vendedores.nmvdd', 'Nome_Vendedor'
EXEC sp_rename 'tb_vendedores.sxvdd', 'Sexo_Vendedor'
EXEC sp_rename 'tb_vendedores.perccomissao', 'Percentual_Comissao'
EXEC sp_rename 'tb_vendedores.matfunc', 'Matricula_Funcionario'

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


UPDATE tb_vendedores
SET Nome_Vendedor =	 'Vendedor 11'
WHERE Codigo_Vendedor = 11

ALTER TABLE tb_vendedores
ALTER COLUMN Sexo_Vendedor VARCHAR(1)

UPDATE tb_vendedores
SET Sexo_Vendedor = 'M'
WHERE Sexo_Vendedor = '1'

UPDATE tb_vendedores
SET Sexo_Vendedor = 'F'
WHERE Sexo_Vendedor = '0'

SELECT * FROM tb_vendedores
