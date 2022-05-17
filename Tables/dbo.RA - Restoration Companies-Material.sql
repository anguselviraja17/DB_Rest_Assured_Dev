SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Restoration Companies-Material] (
		[Material_ID]            [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]             [int] NULL,
		[Material_Name]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Abbrev]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Long_Desc]     [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Type]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Unit_Cost]     [money] NULL,
		[Material_Unit_Type]     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Restoration Companies-Material] SET (LOCK_ESCALATION = TABLE)
GO
