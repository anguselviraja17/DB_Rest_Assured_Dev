SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-XAct-1-Narrative] (
		[ID]             [int] IDENTITY(1, 1) NOT NULL,
		[XActDetail]     [int] NOT NULL,
		[Narrative]      [nvarchar](600) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[EntryDate]      [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Narrative]
	ADD
	CONSTRAINT [DF__Staging-X__Entry__23BE4960]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE NONCLUSTERED INDEX [XActDetail]
	ON [dbo].[Staging-XAct-1-Narrative] ([XActDetail])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-XAct-1-Narrative] ([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Narrative] SET (LOCK_ESCALATION = TABLE)
GO
