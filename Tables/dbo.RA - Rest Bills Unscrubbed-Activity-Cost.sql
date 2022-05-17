SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Activity-Cost] (
		[Rest_Bill_Activity_Entry_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]                      [int] NULL,
		[Rest_Bill_ID]                    [int] NULL,
		[Job_ID]                          [int] NULL,
		[Activity_ID]                     [int] NULL,
		[Activity_Name]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_ID]                    [int] NULL,
		[Equipment_Name]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Duration]                        [decimal](5, 2) NULL,
		[Work_Date]                       [datetime] NULL,
		[Unit_Type]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Quantity]                        [int] NULL,
		[Unit_Cost]                       [money] NULL,
		[Total_Cost]                      [money] NULL,
		[Original_Quantity]               [int] NULL,
		[Original_Duration]               [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Estimate_or_Bill]                [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Original_Row_ID]                 [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Original_Prior_Row_ID]           [int] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Activity-Cost]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Activity_Entry_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Activity-Cost]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Activity-Cost_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Activity-Cost]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Activity-Cost_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Activity-Cost]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Activity-Cost_RA - Rest Bills]
	FOREIGN KEY ([Rest_Bill_ID]) REFERENCES [dbo].[RA - Rest Bills] ([Rest_Bill_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Activity-Cost]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Activity-Cost_RA - Rest Bills]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Activity-Cost]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Activity-Cost_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co_ID]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Activity-Cost]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Activity-Cost_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Activity-Cost] SET (LOCK_ESCALATION = TABLE)
GO
