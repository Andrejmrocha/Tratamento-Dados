USE DW_2
CREATE TABLE Dim_Calendario (
    Data DATE PRIMARY KEY,
    Ano INT,
    Mes INT,
    Dia INT,
    Dia_Semana INT,
    Nome_Dia VARCHAR(20),
    Nome_Mes VARCHAR(20),
    Trimestre INT,
    Semestre INT
);

DECLARE @StartDate DATE = '2010-01-01';
DECLARE @EndDate DATE = '2030-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO Dim_Calendario (Data, Ano, Mes, Dia, Dia_Semana, Nome_Dia, Nome_Mes, Trimestre, Semestre)
    SELECT
        @StartDate AS Data,
        YEAR(@StartDate) AS Ano,
        MONTH(@StartDate) AS Mes,
        DAY(@StartDate) AS Dia,
        DATEPART(WEEKDAY, @StartDate) AS Dia_Semana,
        DATENAME(WEEKDAY, @StartDate) AS Nome_Dia,
        DATENAME(MONTH, @StartDate) AS Nome_Mes,
        CEILING(MONTH(@StartDate) / 3.0) AS Trimestre,
        CEILING(MONTH(@StartDate) / 6.0) AS Semestre;

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;