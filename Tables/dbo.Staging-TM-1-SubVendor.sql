SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-TM-1-SubVendor] (
		[ID]                       [int] IDENTITY(1, 1) NOT NULL,
		[BillID]                   [int] NOT NULL,
		[Field1]                   [int] NULL,
		[Subcontractor/Vendor]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                     [datetime] NULL,
		[Inv / Recpt #]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total]                    [money] NULL,
		[Mark Up %]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Mark Up Total]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Total Due]                [money] NULL,
		[EntryDate]                [datetime] NULL,
		[ParseFormat]              [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-SubVendor]
	ADD
	CONSTRAINT [DF__TM-1-SubV__Entry__4277DAAA]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-TM-1-SubVendor] ([ID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-TM-1-SubVendor] ([BillID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-TM-1-SubVendor] SET (LOCK_ESCALATION = TABLE)
GO
