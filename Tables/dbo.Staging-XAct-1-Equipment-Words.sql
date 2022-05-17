SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-XAct-1-Equipment-Words] (
		[Equipment_Word_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Equipment_Word]        [nchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Staging-Xact-1-Equipment-Words]
		PRIMARY KEY
		CLUSTERED
		([Equipment_Word_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Equipment-Words] SET (LOCK_ESCALATION = TABLE)
GO
