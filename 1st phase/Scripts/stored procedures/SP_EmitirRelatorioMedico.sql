IF OBJECT_ID('EmitirRelatorioMedico') is not null
DROP PROC EmitirRelatorioMedico

GO
CREATE PROC EmitirRelatorioMedico @consulta int, @data date, @prescri��es nvarchar(2000) , @estadoClinico nvarchar(2000), @descricao nvarchar(2000) , @idRelatorio int out
AS 
BEGIN
	IF(SELECT 1 FROM Consulta WHERE idConsulta = @consulta) = 1
	BEGIN
		BEGIN TRAN
		DECLARE @nome nvarchar(1000)
		DECLARE @nif int
		INSERT INTO Relatorio(data,descricao,consulta) values (@data,@descricao,@consulta)
		SET @idRelatorio =  SCOPE_IDENTITY()
		INSERT INTO RelatorioMedico(idRelatorio,estadoClinico,prescricoes)
		values(@idRelatorio,@estadoClinico,@prescri��es)
		COMMIT
		RETURN
	END
	ELSE
		PRINT('N�o foi encontrada a consulta referida')
END
GO

DECLARE @idRelatorio int
EXEC EmitirRelatorioMedico 1,'2015-02-11','ben-u-ron','bom','dores', @idRelatorio
PRINT ('wazaaaa '+cast(@idRelatorio AS nvarchar(10)))