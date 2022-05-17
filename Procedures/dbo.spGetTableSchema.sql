SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE proc spGetTableSchema(@TableName varchar(100)) as
select COLUMN_NAME columnName, DATA_TYPE dataType, CHARACTER_MAXIMUM_LENGTH maxLength
from INFORMATION_SCHEMA.COLUMNS
where Table_Name = @TableName
order by Ordinal_Position
GO
