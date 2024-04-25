SELECT * FROM tbven_item

EXEC sp_rename 'tbven_item', 'tb_venda_produto'

EXEC sp_rename 'tb_venda_produto.cdvenitem', 'Codigo_Venda_Produto'
EXEC sp_rename 'tb_venda_produto.cdpro', 'Codigo_Produto'
EXEC sp_rename 'tb_venda_produto.qtven', 'Quantidade_Venda'
EXEC sp_rename 'tb_venda_produto.vruven', 'Valor_Unitario_Venda'
EXEC sp_rename 'tb_venda_produto.vrtven', 'Valor_Total_Venda'
EXEC sp_rename 'tb_venda_produto.cdven', 'Codigo_Venda'

UPDATE tb_venda_produto
SET Valor_Total_Venda = Quantidade_Venda * Valor_Unitario_Venda

SELECT * FROM tb_venda_produto



