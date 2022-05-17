SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[84944 - Labor] (
		[ID]                             [int] IDENTITY(1, 1) NOT NULL,
		[Field1]                         [float] NULL,
		[Name]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Title]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work Description]               [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Hourly Rate]                    [float] NULL,
		[Date]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reg Hours]                      [float] NULL,
		[PR Hours]                       [float] NULL,
		[Reg Rate]                       [money] NULL,
		[PR Rate]                        [money] NULL,
		[Total]                          [float] NULL,
		[Computed Total Hourly Rate]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Computed PR Hourly Rate]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Reg Total]                      [float] NULL,
		[Diff from Total]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[DateTime]                       [datetime] NULL,
		CONSTRAINT [PK_84944 - Labor]
		PRIMARY KEY
		CLUSTERED
		([ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[84944 - Labor] SET (LOCK_ESCALATION = TABLE)
GO
