SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScraperConfig] (
		[ID]               [int] IDENTITY(1, 1) NOT NULL,
		[ConfigType]       [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Description]      [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ConfigValue1]     [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ConfigValue2]     [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Active]           [bit] NULL,
		[EntryDate]        [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ScraperConfig]
	ADD
	CONSTRAINT [DF__ScraperCo__Activ__520F23F5]
	DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ScraperConfig]
	ADD
	CONSTRAINT [DF__ScraperCo__Entry__5303482E]
	DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[ScraperConfig] SET (LOCK_ESCALATION = TABLE)
GO
