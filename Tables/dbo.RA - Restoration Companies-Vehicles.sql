SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Restoration Companies-Vehicles] (
		[Vehicle_ID]             [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Co_ID]             [int] NULL,
		[Vehicle_Name]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Abbrev]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Long_Desc]      [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Type]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Rate_Day]       [money] NULL,
		[Vehicle_Rate_Week]      [money] NULL,
		[Vehicle_Rate_Month]     [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Restoration Companies-Vehicles] SET (LOCK_ESCALATION = TABLE)
GO
