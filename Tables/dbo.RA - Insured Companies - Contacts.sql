SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Insured Companies - Contacts] (
		[Insured_Co_Contact_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Insured_Co]                        [int] NULL,
		[Insured_Co_Contact_First_Name]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Co_Contact_Last_Name]      [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Co_Contact_Phone]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Co_Contact_Email]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Co_Contact_Address]        [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Co_Contact_City]           [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Co_Contact_State]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Insured_Co_Contact_Zip]            [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Insured Companies - Contacts]
		PRIMARY KEY
		CLUSTERED
		([Insured_Co_Contact_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Insured Companies - Contacts]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Insured Companies - Contacts_RA - Insured Companies]
	FOREIGN KEY ([Insured_Co]) REFERENCES [dbo].[RA - Insured Companies] ([Insured_Co])
ALTER TABLE [dbo].[RA - Insured Companies - Contacts]
	CHECK CONSTRAINT [FK_RA - Insured Companies - Contacts_RA - Insured Companies]

GO
ALTER TABLE [dbo].[RA - Insured Companies - Contacts] SET (LOCK_ESCALATION = TABLE)
GO
