SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-LaborOT1] (
		[ID]               [int] IDENTITY(1, 1) NOT NULL,
		[BillID]           [int] NOT NULL,
		[Field1]           [int] NULL,
		[Name]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Title]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Hourly Rate]      [money] NULL,
		[Date]             [datetime] NULL,
		[OT Hours 15]      [float] NULL,
		[PR Rate]          [money] NULL,
		[OT Factor 15]     [money] NULL,
		[OT Hours 20]      [float] NULL,
		[PR Rate2]         [money] NULL,
		[OT Factor 20]     [money] NULL,
		[Total PR]         [money] NULL,
		[EntryDate]        [datetime] NULL,
		[ParseFormat]      [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborOT1]
	ADD
	CONSTRAINT [DF__TM-1-Labo__Entry__3BCADD1B]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-LaborOT1] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-LaborOT1] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborOT1] SET (LOCK_ESCALATION = TABLE)
GO
