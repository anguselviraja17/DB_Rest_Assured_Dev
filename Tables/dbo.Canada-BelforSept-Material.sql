SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canada-BelforSept-Material] (
		[ID]                   [int] IDENTITY(1, 1) NOT NULL,
		[Field1]               [int] NULL,
		[Item Description]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                 [datetime2](7) NULL,
		[Unit]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Quantity]             [float] NULL,
		[Price]                [money] NULL,
		[Mark Up]              [money] NULL,
		[Total]                [money] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canada-BelforSept-Material] SET (LOCK_ESCALATION = TABLE)
GO
