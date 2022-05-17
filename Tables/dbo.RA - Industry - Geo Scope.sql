SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Geo Scope] (
		[Geo_Scope_ID]            [int] IDENTITY(1, 1) NOT NULL,
		[Geo_Scope_Name]          [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Geo_Scope_Long_Desc]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Industry - Geo Scope]
		PRIMARY KEY
		CLUSTERED
		([Geo_Scope_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Geo Scope] SET (LOCK_ESCALATION = TABLE)
GO
