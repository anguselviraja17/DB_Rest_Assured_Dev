SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillProcessAPIAudit] (
		[ID]             [int] IDENTITY(1, 1) NOT NULL,
		[BillID]         [int] NULL,
		[RestCoID]       [int] NULL,
		[Action]         [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Module]         [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[StatusCode]     [int] NULL,
		[EntryDate]      [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillProcessAPIAudit]
	ADD
	CONSTRAINT [DF__BillProce__Entry__16EE5E27]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[BillProcessAPIAudit] SET (LOCK_ESCALATION = TABLE)
GO
