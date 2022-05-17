SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Audit Results - Sub Cat Types] (
		[Audit_Results_Sub_Cat_Type_ID]           [int] IDENTITY(1, 1) NOT NULL,
		[Audit_Results_Category_Type_ID]          [int] NULL,
		[Audit_Results_Sub_Cat_Type_Name]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Sub_Cat_Type_Weight]       [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Results_Sub_Cat_Display_Order]     [int] NULL,
		CONSTRAINT [PK_RA - Audit Results Sub Cat Types]
		PRIMARY KEY
		CLUSTERED
		([Audit_Results_Sub_Cat_Type_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Cat Types]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Audit Results - Sub Cat Types_RA - Audit Results - Category Types]
	FOREIGN KEY ([Audit_Results_Category_Type_ID]) REFERENCES [dbo].[RA - Audit Results - Category Types] ([Audit_Results_Category_Type_ID])
ALTER TABLE [dbo].[RA - Audit Results - Sub Cat Types]
	CHECK CONSTRAINT [FK_RA - Audit Results - Sub Cat Types_RA - Audit Results - Category Types]

GO
ALTER TABLE [dbo].[RA - Audit Results - Sub Cat Types] SET (LOCK_ESCALATION = TABLE)
GO
