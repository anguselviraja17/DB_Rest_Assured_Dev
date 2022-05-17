SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[2020 GB T&M Pricing - Material] (
		[ID]          [int] IDENTITY(1, 1) NOT NULL,
		[Field1]      [float] NULL,
		[Unit]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Daily]       [money] NULL,
		[Weekly]      [money] NULL,
		[Monthly]     [money] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[2020 GB T&M Pricing - Material] SET (LOCK_ESCALATION = TABLE)
GO
