SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Rule Source Type] (
		[Industry_Rule_Source_Type]     [int] IDENTITY(1, 1) NOT NULL,
		[Industry_Rule_Source_Name]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Industry - Rule Source Type]
		PRIMARY KEY
		CLUSTERED
		([Industry_Rule_Source_Type])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Rule Source Type] SET (LOCK_ESCALATION = TABLE)
GO
