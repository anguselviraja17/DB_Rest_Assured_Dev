SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-LaborReg] (
		[ID]                   [int] IDENTITY(1, 1) NOT NULL,
		[BillID]               [int] NOT NULL,
		[Field1]               [int] NULL,
		[Name]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Title]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work Description]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Hourly Rate]          [money] NULL,
		[Date]                 [datetime] NULL,
		[Reg Hours]            [float] NULL,
		[PR Hours]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reg Rate]             [money] NULL,
		[PR Rate]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Mark Up]              [money] NULL,
		[Total]                [money] NULL,
		[EntryDate]            [datetime] NULL,
		[ParseFormat]          [int] NULL,
		[IsTravel]             [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborReg]
	ADD
	CONSTRAINT [DF__TM-1-Labo__Entry__39E294A9]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborReg]
	ADD
	CONSTRAINT [DF__Staging-T__IsTra__75586032]
	DEFAULT ((0)) FOR [IsTravel]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-LaborReg] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-LaborReg] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborReg] SET (LOCK_ESCALATION = TABLE)
GO
