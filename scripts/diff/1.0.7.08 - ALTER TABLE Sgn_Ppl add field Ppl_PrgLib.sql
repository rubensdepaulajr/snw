
ALTER TABLE dbo.Sgn_Ppl ADD
	Ppl_PrgLib bit NULL
GO
DECLARE @v sql_variant 
SET @v = N'Indica que o papel não possui restrição de prazo para troca da data de validade do procedimento'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Sgn_Ppl', N'COLUMN', N'Ppl_PrgLib'
GO

UPDATE Sgn_Ppl SET Ppl_PrgLib = 0

GO