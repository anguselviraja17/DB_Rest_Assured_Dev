SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Audit_Results - Check Status ID] (
		[Audit_Results_Check_Status_ID]        [int] IDENTITY(1, 1) NOT NULL,
		[Audit_Results_Check_Status__Name]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Audit_Results_Check_Status_ID]
		PRIMARY KEY
		CLUSTERED
		([Audit_Results_Check_Status_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit_Results - Check Status ID] SET (LOCK_ESCALATION = TABLE)
GO
