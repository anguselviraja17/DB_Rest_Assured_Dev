SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParseFormats] (
		[ID]              [int] IDENTITY(1, 1) NOT NULL,
		[Description]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Active]          [bit] NULL,
		[CreatedBy]       [int] NOT NULL,
		[EntryDate]       [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParseFormats]
	ADD
	CONSTRAINT [DF__ParseForm__Activ__0662F0A3]
	DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ParseFormats]
	ADD
	CONSTRAINT [DF__ParseForm__Entry__075714DC]
	DEFAULT (getdate()) FOR [EntryDate]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[ParseFormats] ([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParseFormats] SET (LOCK_ESCALATION = TABLE)
GO
