SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParseFormatItems] (
		[ID]                 [int] IDENTITY(1, 1) NOT NULL,
		[ParseFormat]        [int] NOT NULL,
		[Filename]           [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Columns]            [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Active]             [bit] NULL,
		[CreatedBy]          [int] NOT NULL,
		[EntryDate]          [datetime] NULL,
		[PageIdentifier]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[TargetTable]        [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Required]           [bit] NULL,
		[ColumnsOutput]      [nvarchar](600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParseFormatItems]
	ADD
	CONSTRAINT [DF__ParseForm__Activ__0C1BC9F9]
	DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ParseFormatItems]
	ADD
	CONSTRAINT [DF__ParseForm__Entry__0D0FEE32]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[ParseFormatItems]
	ADD
	CONSTRAINT [DF_ParseFormatItems_Required]
	DEFAULT ((0)) FOR [Required]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ID]
	ON [dbo].[ParseFormatItems] ([ID])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[ParseFormatItems] SET (LOCK_ESCALATION = TABLE)
GO
