SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-Hotels] (
		[ID]                [int] IDENTITY(1, 1) NOT NULL,
		[BillID]            [int] NOT NULL,
		[Name]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]              [datetime] NULL,
		[Hotel Name]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Room #]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Per Room]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Daily Rate]        [money] NULL,
		[Rate %]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rate Billed]       [money] NULL,
		[Mark Up %]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Mark Up Total]     [money] NULL,
		[Total]             [money] NULL,
		[EntryDate]         [datetime] NULL,
		[ParseFormat]       [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Hotels]
	ADD
	CONSTRAINT [DF__TM-1-Hote__Entry__4CF5691D]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-Hotels] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-Hotels] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Hotels] SET (LOCK_ESCALATION = TABLE)
GO
