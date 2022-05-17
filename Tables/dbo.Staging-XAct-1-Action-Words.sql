SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-XAct-1-Action-Words] (
		[Action_Word_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Action_Word]        [nchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Staging-Aact-1-Action-Words]
		PRIMARY KEY
		CLUSTERED
		([Action_Word_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Action-Words] SET (LOCK_ESCALATION = TABLE)
GO
