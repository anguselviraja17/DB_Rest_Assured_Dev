SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staging-XAct-1-Detail] (
		[ID]                           [int] IDENTITY(1, 1) NOT NULL,
		[BillID]                       [int] NOT NULL,
		[Date]                         [datetime] NULL,
		[Category]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description]                  [nvarchar](600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Qty]                          [float] NULL,
		[Unit]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Unit Price]                   [float] NULL,
		[Remove]                       [money] NULL,
		[Replace]                      [money] NULL,
		[Tax]                          [money] NULL,
		[Total]                        [money] NULL,
		[EntryDate]                    [datetime] NULL,
		[Mark Up]                      [money] NULL,
		[Activity_Word_Match]          [bit] NULL,
		[Activity_Word_Match_Name]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Labor_Word_Match]             [bit] NULL,
		[Equipment_Word_Match]         [bit] NULL,
		[Material_Word_Match]          [bit] NULL,
		[Reset]                        [money] NULL,
		[IsTravel]                     [int] NULL,
		CONSTRAINT [PK_Staging-XAct-1-Detail]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Detail]
	ADD
	CONSTRAINT [DF__Staging-X__Entry__25A691D2]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Detail]
	ADD
	CONSTRAINT [DF_Staging-XAct-1-Detail_Activity_Word_Match]
	DEFAULT ((0)) FOR [Activity_Word_Match]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Detail]
	ADD
	CONSTRAINT [DF__Staging-X__IsTra__74643BF9]
	DEFAULT ((0)) FOR [IsTravel]
GO
CREATE NONCLUSTERED INDEX [BillID]
	ON [dbo].[Staging-XAct-1-Detail] ([BillID])
	ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[Staging-XAct-1-Detail] ([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staging-XAct-1-Detail] SET (LOCK_ESCALATION = TABLE)
GO
