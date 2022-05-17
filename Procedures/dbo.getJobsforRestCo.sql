SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getJobsforRestCo]
@Rest_Co Integer
as
select [RA - Jobs-ROMs].Job_ID, [RA - Jobs-ROMs].Job_Name, [RA - Jobs-ROMs].Rest_Co_ID
from [RA - Jobs-ROMs]
where [RA - Jobs-ROMs].Rest_Co_ID = @Rest_Co;
GO
