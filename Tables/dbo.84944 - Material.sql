SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[84944 - Material] (
		[ID]                   [int] IDENTITY(1, 1) NOT NULL,
		[Field1]               [float] NULL,
		[Item Description]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                 [datetime] NULL,
		[Unit]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Quantity]             [float] NULL,
		[Price]                [float] NULL,
		[Total]                [float] NULL,
		[DateTime]             [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[84944 - Material] SET (LOCK_ESCALATION = TABLE)
GO
