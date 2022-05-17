SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-Fees] (
		[ID]              [int] IDENTITY(1, 1) NOT NULL,
		[BillID]          [int] NOT NULL,
		[Description]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Amount]          [money] NULL,
		[EntryDate]       [datetime] NULL,
		[ParseFormat]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Fees]
	ADD
	CONSTRAINT [DF__Staging-T__Entry__08D548FA]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-Fees] ([BillID])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-Fees] ([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Fees] SET (LOCK_ESCALATION = TABLE)
GO
