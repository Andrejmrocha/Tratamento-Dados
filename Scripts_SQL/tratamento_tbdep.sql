EXEC sp_rename 'tbdep', 'tb_dependentes'

EXEC sp_rename 'tb_dependentes.cddep', 'Codigo_Dependente'
EXEC sp_rename 'tb_dependentes.nmdep', 'Nome_Dependente'
EXEC sp_rename 'tb_dependentes.dtnasc', 'Data_Nascimento_Dependente'
EXEC sp_rename 'tb_dependentes.sxdep', 'Sexo_Dependente'
EXEC sp_rename 'tb_dependentes.cdvdd', 'Codigo_Vendedor'

DECLARE @Sexo VARCHAR(2)
SELECT @Sexo = Sexo_Dependente FROM tb_dependentes WHERE Codigo_Dependente = 3

UPDATE tb_dependentes
SET Sexo_Dependente = TRIM(@Sexo)
WHERE Codigo_Dependente = 3

SELECT * FROM tb_dependentes