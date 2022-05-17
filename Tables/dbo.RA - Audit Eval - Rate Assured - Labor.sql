SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Audit Eval - Rate Assured - Labor] (
		[Rate_Assured_Role_ID]                   [int] IDENTITY(1, 1) NOT NULL,
		[Rate_Assured_Role_Name_Primary]         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rate_Assured_Role_Name_Alias]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Rate_Assured_Rate_for_Labor_Audit]      [money] NULL,
		[Rate_Assured_Max_Rate]                  [money] NULL,
		[Rate_Assured_Min_Rate]                  [money] NULL,
		[Rate_Assured_Median_Rate]               [money] NULL,
		[Rate_Assured_Number_of_Occurrences]     [money] NULL,
		[Rate_Assured_3rd_Quartile]              [money] NULL,
		[Rate_Assured_95th]                      [money] NULL,
		[Rate_Assured_98th]                      [money] NULL,
		[Link_to_Reccomendation_Engine]          [int] NULL,
		[Last_Updated_Date]                      [datetime] NULL,
		CONSTRAINT [PK_RA - Audit - Rate Assured - Labor]
		PRIMARY KEY
		CLUSTERED
		([Rate_Assured_Role_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Audit Eval - Rate Assured - Labor] SET (LOCK_ESCALATION = TABLE)
GO
