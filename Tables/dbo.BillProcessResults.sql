SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[BillProcessResults] (
		[ID]                [int] IDENTITY(1, 1) NOT NULL,
		[BillID]            [int] NULL,
		[ParseFormat]       [int] NULL,
		[Rows]              [int] NULL,
		[Processed]         [bit] NULL,
		[Selected]          [bit] NULL,
		[EntryDate]         [datetime] NULL,
		[ProcessedDate]     [datetime] NULL,
		[Archive]           [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillProcessResults]
	ADD
	CONSTRAINT [DF__BillProce__Proce__5B988E2F]
	DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[BillProcessResults]
	ADD
	CONSTRAINT [DF__BillProce__Selec__5C8CB268]
	DEFAULT ((0)) FOR [Selected]
GO
ALTER TABLE [dbo].[BillProcessResults]
	ADD
	CONSTRAINT [DF__BillProce__Entry__5D80D6A1]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[BillProcessResults]
	ADD
	CONSTRAINT [DF__BillProce__Archi__5F691F13]
	DEFAULT ((0)) FOR [Archive]
GO
ALTER TABLE [dbo].[BillProcessResults] SET (LOCK_ESCALATION = TABLE)
GO
