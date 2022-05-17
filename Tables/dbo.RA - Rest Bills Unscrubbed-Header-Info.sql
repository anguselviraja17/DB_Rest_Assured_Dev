SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Header-Info] (
		[Rest_Bill_Header_Info_ID]      [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                  [int] NULL,
		[Job_ID]                        [int] NULL,
		[Rest_Co]                       [int] NULL,
		[Insured_Company_Name]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Restoration_Company_Name]      [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Independent_Adjuster_Name]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Primary_Insurance_company]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Number]                    [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_Date]                      [date] NULL,
		[Job_Estimate_Amount]           [money] NULL,
		[Invoice_Number]                [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Invoice_Date]                  [date] NULL,
		[Invoice_Draw_Number]           [int] NULL,
		[Invoice_Sub_Total]             [money] NULL,
		[Invoice_Tax]                   [money] NULL,
		[Invoice_Previous_Payments]     [money] NULL,
		[Invoice_Bill_Amount]           [money] NULL,
		[Building_Address]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_City]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_State]                [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Zip]                  [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Country]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Address]               [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_City]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_State]                 [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Zip]                   [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Country]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Claim_Number]                  [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Header-Info]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Header_Info_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Header-Info]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Header-Info_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Header-Info]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Header-Info_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Header-Info]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Header-Info_RA - Rest Bills]
	FOREIGN KEY ([Rest_Bill_ID]) REFERENCES [dbo].[RA - Rest Bills] ([Rest_Bill_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Header-Info]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Header-Info_RA - Rest Bills]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Header-Info]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Header-Info_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Header-Info]
	CHECK CONSTRAINT [FK_RA - Rest Bills Unscrubbed-Header-Info_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Header-Info] SET (LOCK_ESCALATION = TABLE)
GO
