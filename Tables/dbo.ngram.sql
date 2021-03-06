SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ngram] (
		[Source]     [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ID]         [int] NULL,
		[Text]       [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ngram] SET (LOCK_ESCALATION = TABLE)
GO
