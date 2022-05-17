SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempDave] (
		[ID]             [int] IDENTITY(1, 1) NOT NULL,
		[ProcName]       [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[BillID]         [int] NULL,
		[XActDetail]     [int] NULL,
		[EntryDate]      [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TempDave]
	ADD
	CONSTRAINT [DF__TempDave__EntryD__3118447E]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[TempDave] SET (LOCK_ESCALATION = TABLE)
GO
