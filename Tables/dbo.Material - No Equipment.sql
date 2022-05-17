SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Material - No Equipment] (
		[ID]         [int] IDENTITY(1, 1) NOT NULL,
		[Field1]     [int] NULL,
		[Item]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rate]       [money] NULL,
		[Unit]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Material - No Equipment] SET (LOCK_ESCALATION = TABLE)
GO
