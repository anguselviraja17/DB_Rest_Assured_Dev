SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Contracts-Vehicles] (
		[Vehicle_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]             [int] NULL,
		[Contract_ID]            [int] NULL,
		[Vehicle_Name]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Abbrev]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Long_Desc]      [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Type]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Rate_Day]       [money] NULL,
		[Vehicle_Rate_Week]      [money] NULL,
		[Vehicle_Rate_Month]     [money] NULL,
		[Rule_Source_Type]       [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Contracts-Vehicles]
		PRIMARY KEY
		CLUSTERED
		([Vehicle_ID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Contracts-Vehicles] SET (LOCK_ESCALATION = TABLE)
GO
