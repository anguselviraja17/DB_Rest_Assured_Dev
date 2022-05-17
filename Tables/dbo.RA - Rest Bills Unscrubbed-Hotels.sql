SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Hotels] (
		[Rest_Bill_Hotel_Entry_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                 [int] NULL,
		[Job_ID]                       [int] NULL,
		[Rest_Co_ID]                   [int] NULL,
		[Name]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Date]                         [datetime] NULL,
		[Hotel Name]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Room #]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Per Room]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Daily Rate]                   [money] NULL,
		[Rate %]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rate Billed]                  [money] NULL,
		[Mark Up %]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Mark Up Total]                [money] NULL,
		[Total]                        [money] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Hotels]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Hotel_Entry_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Hotels] SET (LOCK_ESCALATION = TABLE)
GO
