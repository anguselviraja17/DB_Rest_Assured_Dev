SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-Equipment] (
		[ID]                   [int] IDENTITY(1, 1) NOT NULL,
		[BillID]               [int] NOT NULL,
		[Field1]               [int] NULL,
		[Item Description]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                 [datetime] NULL,
		[Unit]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Quantity]             [float] NULL,
		[Price]                [money] NULL,
		[Mark Up]              [money] NULL,
		[Total]                [money] NULL,
		[EntryDate]            [datetime] NULL,
		[ParseFormat]          [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Equipment]
	ADD
	CONSTRAINT [DF__TM-1-Equi__Entry__3EA749C6]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-Equipment] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-Equipment] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Equipment] SET (LOCK_ESCALATION = TABLE)
GO
