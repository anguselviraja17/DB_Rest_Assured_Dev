SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC spGetBillsToParse(@ParseFormat int) as
SELECT BPR.ID BPR, BP.* 
FROM BillProcessResults (nolock) BPR JOIN BillProcess BP (nolock) 
ON (BPR.BillID = BP.ID AND BPR.Processed = 0 AND BP.OCRState = 2)
WHERE ParseFormat = @ParseFormat
GO
