SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-DataType-Conflicts] (
		[ID]                 [int] IDENTITY(1, 1) NOT NULL,
		[BillID]             [int] NULL,
		[CorrectedIssue]     [nvarchar](800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EntryDate]          [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-DataType-Conflicts]
	ADD
	CONSTRAINT [DF__Staging-D__Entry__2630A1B7]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[Staging-DataType-Conflicts] SET (LOCK_ESCALATION = TABLE)
GO
