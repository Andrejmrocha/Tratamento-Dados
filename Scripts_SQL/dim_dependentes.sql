USE AulaDB

SELECT DISTINCT
	Codigo_Dependente AS 'Codigo',
	Nome_Dependente AS 'Nome',
	Data_Nascimento_Dependente AS 'Data_Nascimento',
	Sexo_Dependente AS 'Sexo'
INTO DW_2..Dim_Dependente
FROM tb_dependentes

