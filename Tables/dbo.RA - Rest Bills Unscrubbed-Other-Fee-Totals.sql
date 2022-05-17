SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Other-Fee-Totals] (
		[Rest_Bill_Other_Fees_Total__Entry]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                          [int] NULL,
		[Job_ID]                                [int] NULL,
		[Fee_Name]                              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Fee_Description]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total_Due]                             [money] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Other-Fee-Totals]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Other_Fees_Total__Entry])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Other-Fee-Totals] SET (LOCK_ESCALATION = TABLE)
GO
