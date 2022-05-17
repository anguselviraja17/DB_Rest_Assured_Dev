SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] (
		[Rest_Bill_Labor_Management_Ratio_ID]        [int] IDENTITY(1, 1) NOT NULL,
		[Rest_Bill_ID]                               [int] NULL,
		[Job_ID]                                     [int] NULL,
		[Rest_Co]                                    [int] NULL,
		[Management_Staff_Ind]                       [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Man_Regular_Hours]                          [float] NULL,
		[Man_Prevailing_Rate_Hours]                  [float] NULL,
		[Man_Regular_Daily_Cost]                     [money] NULL,
		[Man_Prevailing_Cost]                        [money] NULL,
		[Man_Total_Cost]                             [money] NULL,
		[Man_OT_Hours]                               [decimal](28, 2) NULL,
		[Man_Number_Of_Laborers]                     [float] NULL,
		[Man_Total_Estimate_Cost_All_Laborers]       [money] NULL,
		[Staff_Regular_Hours]                        [float] NULL,
		[Staff_Prevailing_Rate_Hours]                [float] NULL,
		[Staff_Regular_Daily_Cost]                   [money] NULL,
		[Staff_Prevailing_Cost]                      [money] NULL,
		[Staff_Total_Cost]                           [money] NULL,
		[Staff_OT_Hours]                             [float] NULL,
		[Staff_Number_Of_Laborers]                   [float] NULL,
		[Staff_Total_Estimate_Cost_All_Laborers]     [money] NULL,
		[Regular_Hours_Ratio]                        [float] NULL,
		[Prevailing_Rate_Hours_Ratio]                [float] NULL,
		[Total_Cost_Ratio]                           [float] NULL,
		[PR_Cost_Ratio]                              [float] NULL,
		[OT_Hours_Ratio]                             [float] NULL,
		[Total_Estimate_Cost_All_Laborers_Ratio]     [float] NULL,
		[Man_to_Staff_Ratio]                         [float] NULL,
		[Industry_Man_to_Staff_Ratio]                [float] NULL,
		[Ratio_Est_Savings]                          [money] NULL,
		[PR_Ratio_Est_Savings]                       [money] NULL,
		[Markup_Ratio_Est_Savings]                   [money] NULL,
		[Man_Markup_Cost]                            [money] NULL,
		[Staff_Markup_Cost]                          [money] NULL,
		[Total_Markup_Cost]                          [money] NULL,
		CONSTRAINT [PK_RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check]
		PRIMARY KEY
		CLUSTERED
		([Rest_Bill_Labor_Management_Ratio_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Rest Bills Unscrubbed-Labor-Man-Ratio-Check] SET (LOCK_ESCALATION = TABLE)
GO
