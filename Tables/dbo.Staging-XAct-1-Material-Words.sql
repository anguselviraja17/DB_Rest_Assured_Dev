SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-XAct-1-Material-Words] (
		[Material_Word_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Material_Word]        [nchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Staging-Xact-1-Material-Words]
		PRIMARY KEY
		CLUSTERED
		([Material_Word_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Material-Words] SET (LOCK_ESCALATION = TABLE)
GO
