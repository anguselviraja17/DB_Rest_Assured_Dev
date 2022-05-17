SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Canada-Belfor-Labor OT 1] (
		[ID]              [int] IDENTITY(1, 1) NOT NULL,
		[Field1]          [int] NULL,
		[Name]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Title]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Hourly Rate]     [money] NULL,
		[Date]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[OT Hours 15]     [float] NULL,
		[PR Rate]         [money] NULL,
		[OT Factor]       [money] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canada-Belfor-Labor OT 1] SET (LOCK_ESCALATION = TABLE)
GO
