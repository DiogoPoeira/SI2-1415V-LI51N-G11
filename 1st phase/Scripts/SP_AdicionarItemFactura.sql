use clinica
GO

CREATE PROC AdicionarItemFactura
@fatura int, @descri��o nvarchar, @montante decimal
AS
BEGIN
	INSERT INTO ItemFatura(idFatura, descricao,montante) values(@fatura,@descri��o,@montante)
	PRINT ('ItemFatura criado com sucesso!')
END