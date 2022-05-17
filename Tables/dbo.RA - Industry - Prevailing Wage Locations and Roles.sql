SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Prevailing Wage Locations and Roles] (
		[Prevailing_Wage_Role_Location_ID]     [int] IDENTITY(1, 1) NOT NULL,
		[Prevailing_Wage_State_Abbrev]         [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Prevailing_Wage_County]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Prevailing_Wage_Location_ID]          [int] NULL,
		[Prevailing_Wage_Role_ID]              [int] NULL,
		[Prevailing_Wage_Craft_Name]           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Prevailing_Wage_Role_Name]            [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Prevailing_Wage_Role_Abbrev]          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Prevailing_Wage_Hourly_Rate]          [money] NULL,
		[Prevailing_Wage_Benefit_Rate]         [money] NULL,
		[Prevailing_Wage_Total_Rate]           [money] NULL,
		[Latest_Rate_Update_Date]              [datetime] NULL,
		[Apprentice_Year_1_Rate]               [int] NULL,
		[Apprentice_Year_2_Rate]               [int] NULL,
		[Apprentice_Year_3_Rate]               [int] NULL,
		[Apprentice_Year_4_Rate]               [int] NULL,
		[Apprentice_Year_5_Rate]               [int] NULL,
		[Rule_Source_Rest_Co]                  [int] NULL,
		[Rule_Source_Type]                     [int] NULL,
		[Rule_Source_Contract_ID]              [int] NULL,
		[Rule_Source_Job_ID]                   [int] NULL,
		[Rule_Source_Bill_ID]                  [int] NULL,
		[Fuzzy_Original_Rule_Basis]            [int] NULL,
		[Date_Executed]                        [date] NULL,
		[Date_Added]                           [date] NULL,
		CONSTRAINT [PK_RA - Industry - Prevailing Wage Locations and Roles]
		PRIMARY KEY
		CLUSTERED
		([Prevailing_Wage_Role_Location_ID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Prevailing Wage Locations and Roles]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Prevailing Wage Locations and Roles_RA - Industry - Prevailing Wage Locations1]
	FOREIGN KEY ([Prevailing_Wage_Location_ID]) REFERENCES [dbo].[RA - Industry - Prevailing Wage Locations] ([Prevailing_Wage_Location_ID])
ALTER TABLE [dbo].[RA - Industry - Prevailing Wage Locations and Roles]
	CHECK CONSTRAINT [FK_RA - Industry - Prevailing Wage Locations and Roles_RA - Industry - Prevailing Wage Locations1]

GO
ALTER TABLE [dbo].[RA - Industry - Prevailing Wage Locations and Roles]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Prevailing Wage Locations and Roles_RA - Restoration Companies]
	FOREIGN KEY ([Rule_Source_Rest_Co]) REFERENCES [dbo].[RA - Restoration Companies] ([Rest_Co_ID])
ALTER TABLE [dbo].[RA - Industry - Prevailing Wage Locations and Roles]
	CHECK CONSTRAINT [FK_RA - Industry - Prevailing Wage Locations and Roles_RA - Restoration Companies]

GO
ALTER TABLE [dbo].[RA - Industry - Prevailing Wage Locations and Roles]
	WITH NOCHECK
	ADD CONSTRAINT [FK_RA - Industry - Prevailing Wage Locations and Roles_RA - Industry - Rule Source Type]
	FOREIGN KEY ([Rule_Source_Type]) REFERENCES [dbo].[RA - Industry - Rule Source Type] ([Industry_Rule_Source_Type])
ALTER TABLE [dbo].[RA - Industry - Prevailing Wage Locations and Roles]
	CHECK CONSTRAINT [FK_RA - Industry - Prevailing Wage Locations and Roles_RA - Industry - Rule Source Type]

GO
ALTER TABLE [dbo].[RA - Industry - Prevailing Wage Locations and Roles] SET (LOCK_ESCALATION = TABLE)
GO
