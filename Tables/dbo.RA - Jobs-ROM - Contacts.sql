SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROM - Contacts] (
		[Job_Contact_ID]       [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Job_ID]               [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Company_Type]         [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Contact_ID]           [int] NULL,
		[Jobs_ROM_Contact]     [int] IDENTITY(1, 1) NOT NULL,
		CONSTRAINT [PK_RA - Jobs-ROM - Contacts]
		PRIMARY KEY
		CLUSTERED
		([Job_Contact_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROM - Contacts] SET (LOCK_ESCALATION = TABLE)
GO
