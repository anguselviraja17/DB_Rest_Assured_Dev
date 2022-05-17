SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Audit Results - Detail Types] (
		[Audit_Results_Detail_Type_ID]         [int] IDENTITY(1, 1) NOT NULL,
		[Audit_Results_Sub_Cat_Type_ID]        [int] NULL,
		[Audit_Results_Detail_Type_Name]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Detail_Type_Weight]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Audit Results Detail Types]
		PRIMARY KEY
		CLUSTERED
		([Audit_Results_Detail_Type_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Results - Detail Types]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Detail Types_RA - Audit Results - Sub Cat Types]
	FOREIGN KEY ([Audit_Results_Sub_Cat_Type_ID]) REFERENCES [dbo].[RA - Audit Results - Sub Cat Types] ([Audit_Results_Sub_Cat_Type_ID])
ALTER TABLE [dbo].[RA - Audit Results - Detail Types]
	CHECK CONSTRAINT [FK_RA - Audit Results - Detail Types_RA - Audit Results - Sub Cat Types]

GO
ALTER TABLE [dbo].[RA - Audit Results - Detail Types] SET (LOCK_ESCALATION = TABLE)
GO
