SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-Timesheet] (
		[ID]                       [int] IDENTITY(1, 1) NOT NULL,
		[BillID]                   [int] NOT NULL,
		[Name]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Labor Classification]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work Description]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                     [datetime] NULL,
		[Time In]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Time Out]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Lunch/Break]              [decimal](5, 2) NULL,
		[Total]                    [decimal](5, 2) NULL,
		[EntryDate]                [datetime] NULL,
		[ParseFormat]              [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Timesheet]
	ADD
	CONSTRAINT [DF__TM-1-Time__Entry__58671BC9]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-Timesheet] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-Timesheet] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-Timesheet] SET (LOCK_ESCALATION = TABLE)
GO
