SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Subcontractor-Cost] (
		[Rest_Bill_Subcontractor_Entry]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                      [int] NULL,
		[Job_ID]                            [int] NULL,
		[Subcontractor_Vendor]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work_Description]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work_Date]                         [date] NULL,
		[Invoice_Receipt]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total_Cost]                        [money] NULL,
		[Markup]                            [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Markup_Total_Cost]                 [money] NULL,
		[Total_Due]                         [money] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Subcontractor-Cost]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Subcontractor_Entry])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Subcontractor-Cost] SET (LOCK_ESCALATION = TABLE)
GO
