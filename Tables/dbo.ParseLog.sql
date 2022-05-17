SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParseLog] (
		[ID]            [int] IDENTITY(1, 1) NOT NULL,
		[Filename]      [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[HashValue]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[CreatedBy]     [int] NOT NULL,
		[EntryDate]     [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParseLog]
	ADD
	CONSTRAINT [DF__ParseLog__EntryD__3429BB53]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[ParseLog] ([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParseLog] SET (LOCK_ESCALATION = TABLE)
GO
