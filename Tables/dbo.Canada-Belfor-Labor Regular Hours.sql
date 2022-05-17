SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canada-Belfor-Labor Regular Hours] (
		[ID]                   [int] IDENTITY(1, 1) NOT NULL,
		[Field1]               [int] NULL,
		[Name]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Title]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work Description]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Hourly Rate]          [money] NULL,
		[Date]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reg Hours]            [float] NULL,
		[PR Hours]             [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reg Rate]             [money] NULL,
		[PR Rate]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Mark Up]              [money] NULL,
		[Total]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canada-Belfor-Labor Regular Hours] SET (LOCK_ESCALATION = TABLE)
GO
