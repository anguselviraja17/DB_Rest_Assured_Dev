SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Prevailing Wage Locations] (
		[Prevailing_Wage_Location_ID]      [int] IDENTITY(1, 1) NOT NULL,
		[Prevailing_Wage_State]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Prevailing_Wage_State_Abbrev]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Prevailing_Wage_County]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		CONSTRAINT [PK_RA - Industry - Prevailing Wage Locations_1]
		PRIMARY KEY
		CLUSTERED
		([Prevailing_Wage_Location_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Prevailing Wage Locations] SET (LOCK_ESCALATION = TABLE)
GO
