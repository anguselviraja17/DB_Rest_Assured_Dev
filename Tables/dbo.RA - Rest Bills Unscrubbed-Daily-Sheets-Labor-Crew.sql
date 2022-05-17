SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Daily-Sheets-Labor-Crew] (
		[Rest_Bill_Crew_Labor_Entry]     [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                   [int] NULL,
		[Project_Manager]                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Job_ID]                         [int] NULL,
		[Work_Date]                      [datetime] NULL,
		[Role_Name]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Abbreviation]              [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Staff_Name]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Agency_Code]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Hotel]                          [bit] NOT NULL,
		[Per_Diem]                       [bit] NOT NULL,
		[Small_Tools]                    [bit] NOT NULL,
		[PPE]                            [bit] NOT NULL,
		[Start_Time]                     [datetime] NULL,
		[End_Time]                       [datetime] NULL,
		[Break_Duration]                 [int] NULL,
		[Total_Hours]                    [int] NULL,
		[Notes]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Daily-Sheets-Labor-Crew] SET (LOCK_ESCALATION = TABLE)
GO
