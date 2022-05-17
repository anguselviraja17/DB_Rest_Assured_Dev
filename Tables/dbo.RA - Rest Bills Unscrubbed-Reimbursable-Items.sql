SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Reimbursable-Items] (
		[Rest_Bill_Reimbursable_Entry]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                     [int] NULL,
		[Job_ID]                           [int] NULL,
		[Labor_Company_Name]               [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reimb_Type]                       [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                             [date] NULL,
		[Invoice_Receipt_Number]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Receipt_Total]                    [money] NULL,
		[Markup]                           [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Markup_Total_Cost]                [money] NULL,
		[Total_Due]                        [money] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Reimbursable-Items]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Reimbursable_Entry])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Reimbursable-Items]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Reimbursable-Items_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Reimbursable-Items]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Reimbursable-Items_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Reimbursable-Items]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Reimbursable-Items_RA - Rest Bills]
	FOREIGN KEY ([Rest_Bill_ID]) REFERENCES [dbo].[RA - Rest Bills] ([Rest_Bill_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Reimbursable-Items]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Reimbursable-Items_RA - Rest Bills]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Reimbursable-Items] SET (LOCK_ESCALATION = TABLE)
GO
