SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Daily-Sheets-Materials-Unique] (
		[Rest_Bill_Matrerial_Sheet_Unique_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                            [int] NULL,
		[Job_ID]                                  [int] NULL,
		[Material_ID]                             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Name]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Daily-Sheets-Materials-Unique] SET (LOCK_ESCALATION = TABLE)
GO
