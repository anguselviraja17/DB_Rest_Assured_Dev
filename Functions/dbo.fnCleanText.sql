SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION fnCleanText(@ToClean nvarchar(600))
RETURNS nvarchar(600) AS
BEGIN
	DECLARE @Result nvarchar(600)
	SET @Result = TRIM(REPLACE(@ToClean, '-', ' '))
    SET @Result = REPLACE(REPLACE(@Result, '"', ' '), '''', ' ')
	SET @Result = REPLACE(REPLACE(@Result, '(', ' '), ')', ' ')
	SET @Result = REPLACE(REPLACE(@Result, '/', ' '), '*', ' ')
	SET @Result = REPLACE(REPLACE(@Result, ',', ' '), '’', ' ')
	SET @Result = REPLACE(REPLACE(@Result, '”', ' '), '.', ' ')
	SET @Result = REPLACE(REPLACE(@Result, '?', ' '), '&', ' ')
	WHILE @Result like '%  %'
		SET @Result = REPLACE(@Result, '  ', ' ')
    RETURN TRIM(@Result)
END;
GO
