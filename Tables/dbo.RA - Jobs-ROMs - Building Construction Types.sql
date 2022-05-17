SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Building Construction Types] (
		[Building_Type_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Building_Type_Short_Name]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Building_Type_Long_Name]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Jobs-ROMs - Building Types]
		PRIMARY KEY
		CLUSTERED
		([Building_Type_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Building Construction Types] SET (LOCK_ESCALATION = TABLE)
GO
