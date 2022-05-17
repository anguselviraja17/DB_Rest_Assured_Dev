SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Daily-Sheets-Equipment] (
		[Rest_Bill_Equipment_Sheet_Entry]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                        [int] NULL,
		[Job_ID]                              [int] NULL,
		[Equipment_ID]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Name]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work_Date]                           [datetime] NULL,
		[Unit_Type]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Quantity]                            [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Daily-Sheets-Equipment] SET (LOCK_ESCALATION = TABLE)
GO