SELECT * FROM tb_produtos

EXEC sp_rename 'tbpro', 'tb_produtos'

EXEC sp_rename 'tb_produtos.cdpro', 'Codigo_Produto'
EXEC sp_rename 'tb_produtos.nmpro', 'Nome_Produto'
EXEC sp_rename 'tb_produtos.tppro', 'Tipo_Produto'
EXEC sp_rename 'tb_produtos.undpro', 'Unidade_Produto'
EXEC sp_rename 'tb_produtos.slpro', 'Saldo_Produto'
EXEC sp_rename 'tb_produtos.stpro', 'Status_Produto'

DELETE FROM tb_produtos WHERE Tipo_Produto IS NULL
