SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getJobsforRestCo3]
@Rest_Co Integer
as
SELECT [RA - Jobs-ROMs].Rest_Co_ID, [RA - Jobs-ROMs].Job_ID, [RA - Jobs-ROMs].Rest_Co_Job_Number, [RA - Jobs-ROMs].Job_Name, [RA - Jobs-ROMs].Job_Description, [RA - Insured Companies].Insured_Name, [RA - Restoration Companies].Rest_Co_Name
FROM ([RA - Jobs-ROMs] LEFT JOIN [RA - Insured Companies] ON [RA - Jobs-ROMs].Insured_Co_ID = [RA - Insured Companies].Insured_Co) LEFT JOIN [RA - Restoration Companies] ON [RA - Jobs-ROMs].Rest_Co_ID = [RA - Restoration Companies].Rest_Co_ID
WHERE ((([RA - Jobs-ROMs].Rest_Co_ID)=@Rest_Co))

SET NOCOUNT ON
GO
