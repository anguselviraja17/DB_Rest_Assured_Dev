SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Time] (
		[Rest_Bill_Labor_Entry]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]              [int] NULL,
		[Job_ID]                    [int] NULL,
		[Role_Name]                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Abbreviation]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Staff_Name]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work_Description]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work_Date]                 [datetime] NULL,
		[Time_In]                   [datetime] NULL,
		[Time_Out]                  [datetime] NULL,
		[Lunch_Break]               [datetime] NULL,
		[Total_Hours]               [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Time] SET (LOCK_ESCALATION = TABLE)
GO
