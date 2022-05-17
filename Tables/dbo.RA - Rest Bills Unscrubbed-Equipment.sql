SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Equipment] (
		[Rest_Bill_Equip_Entry_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]                   [int] NULL,
		[Rest_Bill_ID]                 [int] NULL,
		[Job_ID]                       [int] NULL,
		[Equipment_ID]                 [int] NULL,
		[Equipment_Name]               [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work_Date]                    [datetime] NULL,
		[Unit_Type]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Quantity]                     [float] NULL,
		[Unit_Cost]                    [money] NULL,
		[Total_Cost]                   [money] NULL,
		[Tax_or_OandP]                 [money] NULL,
		[Days_in_Use]                  [float] NULL,
		[Original_Quantity]            [float] NULL,
		[Original_Duration]            [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Estimate_or_Bill]             [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Original_Row_ID]              [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Original_Prior_Row_ID]        [int] NULL,
		[BillProcessID]                [int] NULL,
		[Last_Update_Date]             [datetime] NULL,
		[Markup]                       [money] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Equipment]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Equip_Entry_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equipment]
	ADD
	CONSTRAINT [DF_RA - Rest Bills Unscrubbed-Equipment_Last_Update_Date]
	DEFAULT (getdate()) FOR [Last_Update_Date]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220504-173111]
	ON [dbo].[RA - Rest Bills Unscrubbed-Equipment] ([Equipment_Name])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equipment] SET (LOCK_ESCALATION = TABLE)
GO
