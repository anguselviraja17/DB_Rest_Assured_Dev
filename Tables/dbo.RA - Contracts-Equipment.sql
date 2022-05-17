SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Contracts-Equipment] (
		[Equipment_ID]               [int] NOT NULL,
		[Rest_Co_ID]                 [int] NULL,
		[Contract_ID]                [int] NULL,
		[Equipment_Name]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Abbrev]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Long_Desc]        [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Type]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Equipment_Rate_Day]         [money] NULL,
		[Equipment_Rate_Week]        [money] NULL,
		[Equipment_Rate_Month]       [money] NULL,
		[Rule_Source_Type]           [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contracts_Equipment_ID]     [int] IDENTITY(1, 1) NOT NULL,
		CONSTRAINT [PK_RA - Contracts-Equipment]
		PRIMARY KEY
		CLUSTERED
		([Equipment_ID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Contracts-Equipment] SET (LOCK_ESCALATION = TABLE)
GO
