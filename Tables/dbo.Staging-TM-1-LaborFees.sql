SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-LaborFees] (
		[ID]              [int] IDENTITY(1, 1) NOT NULL,
		[BillID]          [int] NOT NULL,
		[Field1]          [int] NULL,
		[Name]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Small Tools]     [money] NULL,
		[A Per Diem]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[PPE]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Per Diem 1]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Per Diem 2]      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Lodging]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total]           [money] NULL,
		[EntryDate]       [datetime] NULL,
		[N/TT PD]         [money] NULL,
		[009 PD]          [money] NULL,
		[ParseFormat]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborFees]
	ADD
	CONSTRAINT [DF__TM-1-Labo__Entry__473C8FC7]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-LaborFees] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-LaborFees] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborFees] SET (LOCK_ESCALATION = TABLE)
GO
