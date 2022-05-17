SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Cost] (
		[Rest_Bill_Labor_Entry]                [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                         [int] NULL,
		[Job_ID]                               [int] NULL,
		[Rest_Co]                              [int] NULL,
		[Role_Name]                            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Abbreviation]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Staff_Name]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Work_Description]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Management_Staff_Ind]                 [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Role_Hourly_Rate]                     [money] NULL,
		[Work_Date]                            [date] NULL,
		[Regular_Hours]                        [float] NULL,
		[Prevailing_Rate_Hours]                [float] NULL,
		[Regular_Daily_Cost]                   [money] NULL,
		[Prevailing_Cost]                      [money] NULL,
		[Prevailing_Hourly_Rate]               [money] NULL,
		[Total_Cost]                           [money] NULL,
		[Tax_or_OandP]                         [money] NULL,
		[OT_Hours]                             [float] NULL,
		[OT_Rate]                              [money] NULL,
		[Mark_Up_Cost]                         [money] NULL,
		[Number_of_Laborers]                   [int] NULL,
		[Total_Estimate_Cost_All_Laborers]     [money] NULL,
		[Estimate_or_Bill]                     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Original_Row_ID]                      [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Original_Prior_Row_ID]                [int] NULL,
		[Last_Update_Date]                     [datetime] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Labor-Cost]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Labor_Entry])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Cost]
	ADD
	CONSTRAINT [DF_RA - Rest Bills Unscrubbed-Labor-Cost_Last_Update_Date]
	DEFAULT (getdate()) FOR [Last_Update_Date]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220504-172151]
	ON [dbo].[RA - Rest Bills Unscrubbed-Labor-Cost] ([Role_Name])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Cost] SET (LOCK_ESCALATION = TABLE)
GO
