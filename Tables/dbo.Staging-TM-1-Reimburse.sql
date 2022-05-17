SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-Reimburse] (
		[ID]                     [int] IDENTITY(1, 1) NOT NULL,
		[BillID]                 [int] NOT NULL,
		[Field1]                 [int] NULL,
		[Labor/Company Name]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reimb Type]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Receipt #]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Receipt Total]          [money] NULL,
		[Mark Up %]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Mark Up Total]          [money] NULL,
		[Total]                  [money] NULL,
		[EntryDate]              [datetime] NULL,
		[ParseFormat]            [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Reimburse]
	ADD
	CONSTRAINT [DF__TM-1-Reim__Entry__4924D839]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-Reimburse] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-Reimburse] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Reimburse] SET (LOCK_ESCALATION = TABLE)
GO
