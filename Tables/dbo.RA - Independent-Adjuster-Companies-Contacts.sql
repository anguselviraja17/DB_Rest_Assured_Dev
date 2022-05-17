SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Independent-Adjuster-Companies-Contacts] (
		[IA_Co_Contact_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[IA_Adjuster_Co_ID]            [int] NOT NULL,
		[IA_Co_Contact_First_Name]     [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Contact_Last_Name]      [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Contact_Phone]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Contact_Email]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Contact_Address]        [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Contact_City]           [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Contact_State]          [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[IA_Co_Contact_Zip]            [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Independent-Adjuster-Companies-Contacts_1]
		PRIMARY KEY
		CLUSTERED
		([IA_Co_Contact_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Independent-Adjuster-Companies-Contacts]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Independent-Adjuster-Companies-Contacts_RA - Independent-Adjuster-Companies]
	FOREIGN KEY ([IA_Adjuster_Co_ID]) REFERENCES [dbo].[RA - Independent-Adjuster-Companies] ([Ind_Adjuster_Co_ID])
ALTER TABLE [dbo].[RA - Independent-Adjuster-Companies-Contacts]
	CHECK CONSTRAINT [FK_RA - Independent-Adjuster-Companies-Contacts_RA - Independent-Adjuster-Companies]

GO
ALTER TABLE [dbo].[RA - Independent-Adjuster-Companies-Contacts] SET (LOCK_ESCALATION = TABLE)
GO
