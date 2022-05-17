SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Insurance Co Linkage] (
		[Job_Insurance_Co_Linkage_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Job_ID]                          [int] NULL,
		[Insurance_Co_ID]                 [int] NULL,
		[Coverage_Percent]                [decimal](5, 2) NULL,
		[Ins_Contact_for_Job]             [int] NULL,
		[Claim_Number]                    [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Jobs-ROMs - Insurance Co Linkage]
		PRIMARY KEY
		CLUSTERED
		([Job_Insurance_Co_Linkage_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Insurance Co Linkage]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Insurance Co Linkage_RA - Jobs-ROMs - Insurance Co Linkage]
	FOREIGN KEY ([Insurance_Co_ID]) REFERENCES [dbo].[RA - Insurance Companies] ([Insurance_Co_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Insurance Co Linkage]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Insurance Co Linkage_RA - Jobs-ROMs - Insurance Co Linkage]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Insurance Co Linkage]
	WITH CHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Insurance Co Linkage_RA - Insurance Companies - Contacts]
	FOREIGN KEY ([Ins_Contact_for_Job]) REFERENCES [dbo].[RA - Insurance Companies - Contacts] ([IC_Co_Contact_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Insurance Co Linkage]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Insurance Co Linkage_RA - Insurance Companies - Contacts]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Insurance Co Linkage]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Jobs-ROMs - Insurance Co Linkage_RA - Jobs-ROMs]
	FOREIGN KEY ([Job_ID]) REFERENCES [dbo].[RA - Jobs-ROMs] ([Job_ID])
ALTER TABLE [dbo].[RA - Jobs-ROMs - Insurance Co Linkage]
	CHECK CONSTRAINT [FK_RA - Jobs-ROMs - Insurance Co Linkage_RA - Jobs-ROMs]

GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Insurance Co Linkage] SET (LOCK_ESCALATION = TABLE)
GO
