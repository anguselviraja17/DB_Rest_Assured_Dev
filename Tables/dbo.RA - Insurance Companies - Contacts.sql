SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Insurance Companies - Contacts] (
		[IC_Co_Contact_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Insurance_Co_ID]              [int] NULL,
		[IC_Co_Contact_First_Name]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IC_Co_Contact_Last_Name]      [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IC_Co_Contact_Phone]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IC_Co_Contact_Email]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IC_Co_Contact_Address]        [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IC_Co_Contact_City]           [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IC_Co_Contact_State]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IC_Co_Contact_Zip]            [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Insurance Companies - Contacts]
		PRIMARY KEY
		CLUSTERED
		([IC_Co_Contact_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Insurance Companies - Contacts]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Insurance Companies - Contacts_RA - Insurance Companies]
	FOREIGN KEY ([Insurance_Co_ID]) REFERENCES [dbo].[RA - Insurance Companies] ([Insurance_Co_ID])
ALTER TABLE [dbo].[RA - Insurance Companies - Contacts]
	CHECK CONSTRAINT [FK_RA - Insurance Companies - Contacts_RA - Insurance Companies]

GO
ALTER TABLE [dbo].[RA - Insurance Companies - Contacts] SET (LOCK_ESCALATION = TABLE)
GO
