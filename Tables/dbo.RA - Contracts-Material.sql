SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Contracts-Material] (
		[Contract_Material_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Contract_ID]              [int] NULL,
		[Rest_Co_ID]               [int] NULL,
		[Material_Name]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Abbrev]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Long_Desc]       [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Type]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Material_Unit_Cost]       [money] NULL,
		[Material_Unit_Type]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rule_Source_Type]         [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_RA - Contracts-Material]
		PRIMARY KEY
		CLUSTERED
		([Contract_Material_ID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Contracts-Material] SET (LOCK_ESCALATION = TABLE)
GO
