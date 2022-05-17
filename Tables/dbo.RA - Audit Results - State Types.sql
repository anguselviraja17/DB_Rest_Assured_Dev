SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Audit Results - State Types] (
		[Audit_Approval_State_Type_ID]        [int] IDENTITY(1, 1) NOT NULL,
		[Audit_Approval_State_Name]           [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Approval_State_Short_Name]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Audit_Approval_Abbrev]               [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Exception_Filter]                    [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Audit Result State Types]
		PRIMARY KEY
		CLUSTERED
		([Audit_Approval_State_Type_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Results - State Types] SET (LOCK_ESCALATION = TABLE)
GO
