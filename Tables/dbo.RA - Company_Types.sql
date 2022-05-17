SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Company_Types] (
		[Company_Type_ID]       [int] IDENTITY(1, 1) NOT NULL,
		[Company_Type_Name]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Type_Desc]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Company_Types]
		PRIMARY KEY
		CLUSTERED
		([Company_Type_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Company_Types] SET (LOCK_ESCALATION = TABLE)
GO
