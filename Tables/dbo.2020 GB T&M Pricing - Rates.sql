SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[2020 GB T&M Pricing - Rates] (
		[ID]                       [int] IDENTITY(1, 1) NOT NULL,
		[Field1]                   [float] NULL,
		[Restoration Services]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rate / Hour]              [money] NULL,
		[Abbrev]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[2020 GB T&M Pricing - Rates] SET (LOCK_ESCALATION = TABLE)
GO
