SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Jobs-ROMs - Estimates Phases] (
		[Job_Phase_ID]                     [int] IDENTITY(1, 1) NOT NULL,
		[Job_ID]                           [int] NULL,
		[Phase_Name]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phase_Description]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phase_Type]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phase_Work_Summary]               [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phase_Cost_Estimate_Low]          [money] NULL,
		[Phase_Cost_Estimate_High]         [money] NULL,
		[Phase_Duration_Estimate_Low]      [int] NULL,
		[Phase_Duration_Estimate_High]     [int] NULL,
		[Phase_Start_Date]                 [datetime] NULL,
		[Phase_End_Date]                   [datetime] NULL,
		[Phase_Man_to_Tech_Ratio]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Phase_Workday_Length_Range]       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Jobs-ROMs - Estimates Phases] SET (LOCK_ESCALATION = TABLE)
GO
