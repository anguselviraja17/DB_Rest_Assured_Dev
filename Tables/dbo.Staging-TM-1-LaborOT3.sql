SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-LaborOT3] (
		[ID]                                            [int] IDENTITY(1, 1) NOT NULL,
		[BillID]                                        [int] NOT NULL,
		[Field1]                                        [int] NULL,
		[Name]                                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Title]                                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Hourly Rate]                                   [money] NULL,
		[Date]                                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[OT Hours 15]                                   [float] NULL,
		[PR Rate]                                       [money] NULL,
		[OT Factor]                                     [money] NULL,
		[Factor 15T Hours20R RateT Factor20otal PR]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EntryDate]                                     [datetime] NULL,
		[ParseFormat]                                   [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborOT3]
	ADD
	CONSTRAINT [DF__TM-1-Labo__Entry__5D60DB10]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-LaborOT3] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-LaborOT3] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-LaborOT3] SET (LOCK_ESCALATION = TABLE)
GO
