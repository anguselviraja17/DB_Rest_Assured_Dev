SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog] (
		[ID]                 [int] IDENTITY(1, 1) NOT NULL,
		[ErrorNumber]        [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ErrorState]         [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ErrorSeverity]      [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ErrorProcedure]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ErrorLine]          [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ErrorMessage]       [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EntryDate]          [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog]
	ADD
	CONSTRAINT [DF__ErrorLog__EntryD__038683F8]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[ErrorLog] SET (LOCK_ESCALATION = TABLE)
GO
