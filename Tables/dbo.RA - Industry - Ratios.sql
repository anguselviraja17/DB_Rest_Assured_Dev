SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Ratios] (
		[Industry_Ratio_ID]                      [int] IDENTITY(1, 1) NOT NULL,
		[Industry_Ratio_Scope]                   [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Ratio_Type_ID]                 [int] NULL,
		[Industry_Ratio_Type_Name]               [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Ratio_Base]                    [float] NULL,
		[Industry_Ratio_Mulitple]                [float] NULL,
		[Industry_Ratio_Override_Bill_ID]        [int] NULL,
		[Industry_Ratio_Override_Rest_Co_ID]     [int] NULL,
		[Industry_Ratio_Override_Ins_Co_ID]      [int] NULL,
		[Industry_Ratio_Override_IA_Co_ID]       [int] NULL,
		[Industry_Ratio_Override_Comment]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Ratio_Override_Update_ID]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Update_Date]                   [datetime] NULL,
		CONSTRAINT [PK_RA - Industry - Ratios]
		PRIMARY KEY
		CLUSTERED
		([Industry_Ratio_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Ratios] SET (LOCK_ESCALATION = TABLE)
GO
