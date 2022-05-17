SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip-Credit] (
		[Rest_Bill_Equip_Term_Credit_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]                         [int] NULL,
		[Rest_Bill_ID]                       [int] NULL,
		[Job_ID]                             [int] NULL,
		[Equipment_ID]                       [int] NULL,
		[Equipment_Name]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Quantity]                           [int] NULL,
		[Daily_Rate]                         [money] NULL,
		[Weekly_Rate]                        [money] NULL,
		[Monthly_Rate]                       [money] NULL,
		[Original_Cost]                      [money] NULL,
		[New_Cost]                           [money] NULL,
		[Total_Credit]                       [money] NULL,
		[Original_Row_ID]                    [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Original_Prior_Row_ID]              [int] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Equip-Credit]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Equip_Term_Credit_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip-Credit]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Equip-Credit_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip-Credit]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Equip-Credit_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip-Credit]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Equip-Credit_RA - Rest Bills]
	FOREIGN KEY ([Rest_Bill_ID]) REFERENCES [dbo].[RA - Rest Bills] ([Rest_Bill_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip-Credit]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Equip-Credit_RA - Rest Bills]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip-Credit]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Equip-Credit_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co_ID]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip-Credit]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Equip-Credit_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Equip-Credit] SET (LOCK_ESCALATION = TABLE)
GO
