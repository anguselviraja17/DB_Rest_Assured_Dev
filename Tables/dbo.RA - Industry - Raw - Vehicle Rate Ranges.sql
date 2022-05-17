SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RA - Industry - Raw - Vehicle Rate Ranges] (
		[Industry_Vehicle_ID]                [int] IDENTITY(1, 1) NOT NULL,
		[Geo_Scope]                          [int] NOT NULL,
		[Geo_Country]                        [int] NULL,
		[Geo_State_Prov]                     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Geo_Zip]                            [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Geo_County]                         [int] NULL,
		[Vehicle_Name]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Abbrev]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Long_Desc]                  [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Type]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Vehicle_Low_Rate_Day]               [money] NULL,
		[Vehicle_Low_Rate_Week]              [money] NULL,
		[Vehicle_Low_Rate_Month]             [money] NULL,
		[Vehicle_High_Rate_Day]              [money] NULL,
		[Vehicle_High_Rate_Week]             [money] NULL,
		[Vehicle_High_Rate_Month]            [money] NULL,
		[Rule_Source_Type]                   [int] NULL,
		[Vehicle_Unit_Type]                  [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Industry_Standard_Vehicle_Code]     [varbinary](50) NULL,
		[Rule_Source_Rest_Co]                [int] NULL,
		[Rule_Source_Contract_ID]            [int] NULL,
		[Rule_Source_Job_ID]                 [int] NULL,
		[Rule_Source_Bill_ID]                [int] NULL,
		[Fuzzy_Original_Rule_Basis]          [int] NULL,
		[Date_Executed]                      [date] NULL,
		[Date_Added]                         [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[RA - Industry - Raw - Vehicle Rate Ranges] SET (LOCK_ESCALATION = TABLE)
GO
