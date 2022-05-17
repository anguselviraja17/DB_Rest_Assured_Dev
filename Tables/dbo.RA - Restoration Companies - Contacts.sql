SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Restoration Companies - Contacts] (
		[Rest_Co_Contact_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]                     [int] NULL,
		[Rest_Co_Contact_First_Name]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Contact_Last_Name]      [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Contact_Phone]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Contact_Email]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Contact_Address]        [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Contact_City]           [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Contact_State]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rest_Co_Contact_Zip]            [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Restoration Companies - Contacts]
		PRIMARY KEY
		CLUSTERED
		([Rest_Co_Contact_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Restoration Companies - Contacts]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Restoration Companies - Contacts_RA - Restoration Companies]
	FOREIGN KEY ([Rest_Co_ID]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Restoration Companies - Contacts]
	CHECK CONSTRAINT [FK_RA - Restoration Companies - Contacts_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Restoration Companies - Contacts] SET (LOCK_ESCALATION = TABLE)
GO
